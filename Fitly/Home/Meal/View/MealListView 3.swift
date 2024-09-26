//
//  MealListView 3.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//


import SwiftUI
import Foundation
import Combine

struct MealListView: View {
    @StateObject private var viewModel = MealViewModel() 

    var body: some View {
        List(viewModel.mealData) { meal in
            Text("\(meal.name) - \(meal.calories) kalori")
        }
        .onAppear {
            loadMeals()
        }
    }

    private func loadMeals() {
        viewModel.parseJSON(resourceName: "meal") { success in
            if !success {
                print("Failed to load meals.")
            }
        }
    }
}
