//
//  RecipeModel.swift
//  Fitly
//
//  Created by İrem Sever on 21.09.2024.
//

import Foundation

// MARK: - RecipeModel
struct RecipeModel: Codable {
    let recipes: [Recipe]
}

// MARK: - Recipe
struct Recipe: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    let servings: Int
    let prep_time: String
    let cook_time: String
    let total_time: String
    let ingredients: [Ingredient]
    let instructions: [Instruction]
    let nutritions: Nutritions
    let tags: [Tag]
    let image: String
}

// MARK: - Ingredient
struct Ingredient: Codable {
    var id = UUID()
    let name: String
    let quantity: String
    let unit: String
    let notes: String?
    let image: String?
}

// MARK: - Instruction
struct Instruction: Codable {
    let step: Int
    let description: String
}

// MARK: - Nutritions
struct Nutritions: Codable {
    let caloriesPerServing: Int
    let proteinPerServing: String
    let carbohydratesPerServing: String
    let fatsPerServing: String
    let fiberPerServing: String
}

// MARK: - Tag
struct Tag: Codable {  
    let name: String
    let category: String
}
