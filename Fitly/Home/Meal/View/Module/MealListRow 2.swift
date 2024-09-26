//
//  MealListRow 2.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//


import SwiftUI

struct MealListRow: View {
    @StateObject private var viewModel = MealViewModel()

    var body: some View {
        VStack {
            HStack {
                List(viewModel.mealData) { meal in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(meal.name)")
                                .font(.subheadline)
                            Text("\(meal.calories) calories")
                                .font(.subheadline)
                                .foregroundColor(.fitlyDarkGray)
                                .font(.caption2)
                        }
                        Spacer()
                        Image("plus")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.fitlyDarkGray)
                            .opacity(0.8)
                            .padding(8)
                            .background(Color.fitlyGreen.opacity(1))
                            .clipShape(Circle())
                            .bold()
                    }
                }
                .onAppear {
                    loadMeals()
                }
                // Set the list background to be transparent
                .scrollContentBackground(.hidden) // This is available from iOS 16+
                .background(Color.clear) // Make the background clear
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
    MealListRow()
}
