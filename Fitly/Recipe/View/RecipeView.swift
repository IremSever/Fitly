//
//  RecipeView.swift
//  Fitly
//
//  Created by İrem Sever on 8.09.2024.
//
import SwiftUI
struct RecipeView: View {
    @ObservedObject var viewModel = RecipeViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Get your recipe")
                    .font(.subheadline)
                    .padding()
    
            }
            
            Categories(viewModel: viewModel)
    
           
            HStack {
                Text("Popular")
                    .font(.subheadline)
            }
            .padding(.horizontal)
            

            PopularRecipe(viewModel: viewModel)
       
        }
        
    }
}

#Preview {
    RecipeView()
}
