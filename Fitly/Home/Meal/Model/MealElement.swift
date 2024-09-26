//
//  MealElement.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//


struct MealElement: Codable, Identifiable {
    let id: UUID // Ensure this is a valid UUID in your JSON
    let name, portion: String
    let calories: Int
    let proteinG, fatsG, carbsG, fiberG: Double
    let sugarsG: Double
    let servingSizeG: Int

    enum CodingKeys: String, CodingKey {
        case id, name, portion, calories
        case proteinG = "protein_g"
        case fatsG = "fats_g"
        case carbsG = "carbs_g"
        case fiberG = "fiber_g"
        case sugarsG = "sugars_g"
        case servingSizeG = "serving_size_g"
    }
}