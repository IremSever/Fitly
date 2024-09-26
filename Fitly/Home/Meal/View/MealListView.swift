//
//  MealListView.swift
//  Fitly
//
//  Created by İrem Sever on 25.09.2024.
//
import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = MealViewModel()
    var body: some View {
        VStack {
            MealSearchBar(viewModel: viewModel)
                .padding()

            MealListRow()
            
            
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
