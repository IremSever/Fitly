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
                Text("Find your delicious recipe easly!")
                    .font(.subheadline)
                    .padding()
    
            }
            SearchBar(viewModel: viewModel)
            
            HStack {
                Text("Categories")
                    .font(.subheadline)
            }
            .padding(.horizontal)
            Categories(viewModel: viewModel)
                .padding(.horizontal)
    
           
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
