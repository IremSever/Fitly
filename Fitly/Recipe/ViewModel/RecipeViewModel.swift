//
//  RecipeViewModel.swift
//  Fitly
//
//  Created by İrem Sever on 21.09.2024.
//

import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        loadRecipes()
    }

    func loadRecipes() {
        let sampleRecipes = loadSampleRecipes()
        self.recipes = sampleRecipes
    }

    private func loadSampleRecipes() -> [Recipe] {
        return [
            Recipe(
                id: UUID(),
                name: "Grilled Chicken Salad with Avocado and Quinoa",
                description: "A healthy and balanced meal packed with lean protein.",
                servings: 2,
                prep_time: "15 minutes",
                cook_time: "20 minutes",
                total_time: "35 minutes",
                ingredients: [
                    Ingredient(name: "Chicken Breast", quantity: "2", unit: "pieces", notes: "Boneless and skinless", image: "https://example.com/images/chicken_breast.jpg"),
                    Ingredient(name: "Olive Oil", quantity: "2", unit: "tablespoons", notes: "For grilling", image: "https://example.com/images/olive_oil.jpg"),
                    // Diğer malzemeler...
                ],
                instructions: [
                    Instruction(step: 1, description: "Preheat a grill or grill pan over medium heat. Season the chicken breasts with olive oil, salt, and black pepper."),
                    // Diğer adımlar...
                ],
                nutritions: Nutritions(caloriesPerServing: 450, proteinPerServing: "35g", carbohydratesPerServing: "25g", fatsPerServing: "22g", fiberPerServing: "8g"),
                tags: [
                    Tag(name: "healthy", category: "diet"),
                    Tag(name: "gluten-free", category: "diet"),
                    Tag(name: "high-protein", category: "nutrition"),
                    Tag(name: "low-carb", category: "nutrition"),
                    Tag(name: "quick", category: "time")
                ],
                image: "https://hips.hearstapps.com/hmg-prod/images/grilled-chicken-salad-lead-6628169550105.jpg"
            ),
            Recipe(
                id: UUID(),
                name: "Vegan Lentil Soup",
                description: "A hearty and nutritious vegan soup filled with lentils and vegetables.",
                servings: 4,
                prep_time: "10 minutes",
                cook_time: "30 minutes",
                total_time: "40 minutes",
                ingredients: [
                    Ingredient(name: "Green Lentils", quantity: "1", unit: "cup", notes: "Rinsed", image: "https://example.com/images/lentils.jpg"),
          
                ],
                instructions: [
                    Instruction(step: 1, description: "In a large pot, heat olive oil over medium heat. Sauté the onions, carrots, and celery for 5 minutes."),
                   
                ],
                nutritions: Nutritions(caloriesPerServing: 300, proteinPerServing: "18g", carbohydratesPerServing: "40g", fatsPerServing: "7g", fiberPerServing: "12g"),
                tags: [
                    Tag(name: "vegan", category: "diet"),
                    Tag(name: "gluten-free", category: "diet"),
                    Tag(name: "high-fiber", category: "nutrition"),
                    Tag(name: "low-fat", category: "nutrition")
                ],
                image: "https://simple-veganista.com/wp-content/uploads/2019/10/vegan-lentil-soup-recipe-5.jpg"
            )
        ]
    }

    func findCommonTags() -> [String] {
        guard let firstRecipe = recipes.first else { return [] }
        
        let firstRecipeTagNames = Set(firstRecipe.tags.map { $0.name })
        
        return recipes.dropFirst().reduce(firstRecipeTagNames) { commonTags, recipe in
            let recipeTagNames = Set(recipe.tags.map { $0.name })
            return commonTags.intersection(recipeTagNames)
        }
        .sorted()
    }
}
