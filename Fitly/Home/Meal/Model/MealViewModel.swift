//
//  MealViewModel.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//


import Foundation
import Combine

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []  // Changed to directly hold Meal objects
    private var cancellables = Set<AnyCancellable>()

    init() {
        loadMealList()
    }
    
    func loadMealList() {
        guard let url = Bundle.main.url(forResource: "meal", withExtension: "json") else {
            print("Not found local JSON file.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let mealModel = try JSONDecoder().decode(MealModel.self, from: data) // Decode as MealModel
            self.meals = mealModel.meal  // Set meals directly from the decoded MealModel
        } catch {
            print("Error: \(error)")
        }
    }
}
