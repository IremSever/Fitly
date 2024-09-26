//
//  MealViewModel 2.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//


class MealViewModel: ObservableObject {
    @Published var mealData: [MealElement] = [] // Use @Published to update the view

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
    
    private func handleResponse(_ mealModel: MealModel) {
        self.mealData = mealModel.meal
    }
}

struct MealModel: Codable {
    let meal: [MealElement]
}