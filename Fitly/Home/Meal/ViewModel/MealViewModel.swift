//
//  MealViewModel.swift
//  Fitly
//
//  Created by İrem Sever on 25.09.2024.
//
import Foundation
import Combine

class MealViewModel: ObservableObject {
    @Published var mealData: [MealElement] = [] 
    @Published var filteredMeals: [MealElement] = []
    
    func parseJSON(resourceName: String, completion: @escaping (Bool) -> Void) {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            print("JSON file not found in bundle")
            completion(false)
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(MealModel.self, from: data)
            handleResponse(response)
            completion(true)
        } catch {
            print("JSON conversion error: \(error)")
            completion(false)
        }
    }
    
    func filterMeals(with searchText: String) {
        if searchText.isEmpty {
            filteredMeals = mealData
        } else {
            filteredMeals = mealData.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    private func handleResponse(_ mealModel: MealModel) {
        self.mealData = mealModel.meal
    }
}

    



