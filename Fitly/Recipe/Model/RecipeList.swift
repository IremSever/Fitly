//
//  RecipeList.swift
//  Fitly
//
//  Created by İrem Sever on 21.09.2024.
//

import Foundation

struct RecipeList: Decodable {
    let meals: [Meal]
}

struct Dessert: Decodable {
    let strRecipe: String?
    let strRecipeThumb: String?
    let idMeal: String?
}
