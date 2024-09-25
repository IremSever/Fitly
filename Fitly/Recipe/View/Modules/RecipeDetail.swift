//
//  RecipeDetail.swift
//  Fitly
//
//  Created by İrem Sever on 21.09.2024.
//

import Foundation
import SwiftUI
import AVKit


struct RecipeDetail: View {
    
    // View Model
    @StateObject var viewModel: RecipeViewModel
    
    // Private
    @State private var selectedSegment = 0
    @State private var shouldFetchData = true
    
    var body: some View {
        ScrollView(.vertical) {
            
            switch viewModel.state {
            case .success(let meal):
                VStack(spacing: 0) {
                    
                    ZStack(alignment: .bottom) {
                        
                        // Image
                        ImageLoaderView(
                            url: URL(string: meal.strMealThumb ?? ""),
                            placeholder: Image(systemName: "frying.pan"),
                            width: 450,
                            height: 450,
                            cornerRadius: 0
                        ).mask {
                            Path(roundedRect: CGRect(x: 0, y: 0, width: 450, height: 450),
                                 cornerRadii: RectangleCornerRadii(bottomLeading: 90, bottomTrailing: 90))
                        }
                        
                        // Info Rectangle
                        RecipeDetailInfo(meal: meal)
                            .offset(y: 65)
                    }
                    
                    
                    // Picker
                    Picker("", selection: $selectedSegment) {
                        Text("Ingredients").tag(0)
                        Text("Instructions").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 350)
                    .padding(.top, 85)
                    .padding(.bottom, 20)
                    
                    if selectedSegment == 0 {
                        RecipeDetailIngredients(recipes: meal)
                            .transition(.push(from: .trailing))
                    } else {
                        RecipeDetailInstruction(viewModel: viewModel)
                            .transition(.push(from: .leading))
                            .padding(.horizontal)
                    }
                                    
                }
            default:
                EmptyView()
            }
            
        }
        .ignoresSafeArea(edges: .top)
        .animation(.easeInOut(duration: 0.5), value: selectedSegment)
        
        // MARK: - Networking
        .task {
            if shouldFetchData {
                viewModel.fetchDessertDetails(for: $viewModel.meal.idMeal)
                shouldFetchData = false
            }
        }
        
        // MARK: - Alerting
        .alert("Something went wrong!", isPresented: $viewModel.didError, presenting: viewModel.state) { _ in
            Button("Cancel", role: .destructive) {}
            
            Button("Retry", role: .cancel) {
                viewModel.fetchDessertDetails(for: $viewModel.meal.idMeal ?? "")
            }
        } message: { detail in
            Image(systemName: viewModel.alertImageName)
                .foregroundStyle(.red)
                .font(.system(size: 40))
            Text(viewModel.errorMessage ?? "Unknown Error")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
        }
        
    }
}

#Preview {
    RecipeView(viewModel: RecipeViewModel(meal: MockData().recipe.meals[0]))
}
