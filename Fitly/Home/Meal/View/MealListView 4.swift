//
//  MealListView 4.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//


import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = MealViewModel()

    var body: some View {
        VStack {
            MealSearchBar(viewModel: viewModel)
                .padding()

            List(viewModel.filteredMeals) { meal in
                MealListRow(meal: meal) // Pass each meal to a row view
            }
            .onAppear {
                loadMeals() // Load meals when the view appears
            }
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

#Preview {
    MealListView()
}
