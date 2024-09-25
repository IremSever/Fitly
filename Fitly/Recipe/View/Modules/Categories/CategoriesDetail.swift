//
//  CategoriesDetail.swift
//  Fitly
//
//  Created by İrem Sever on 25.09.2024.
//

import SwiftUI

struct CategoriesDetail: View {
    @ObservedObject var viewModel: RecipeViewModel
    @State private var selectedTag: String? = nil
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Capsule()
                    .fill(Color.fitlyYellow.opacity(0.7))
                    .frame(width: 90, height: 120)
                
                VStack(spacing: 10) {
                    Circle()
                        .fill(Color.fitlyGreen)
                        .frame(width: 80, height: 80)
                        
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                           HStack {
                               ForEach(viewModel.recipes.flatMap { $0.tags }, id: \.name) { tag in
                                   Button(action: {
                                       selectedTag = tag.name
                                   }) {
                                       Text(tag.name)
                                           .padding()
                                           .background(Color.fitlyGreen.opacity(0.7))
                                           .foregroundColor(.white)
                                           .cornerRadius(8)
                                   }
                               }
                           }
                           .padding()
                       }

                       List {
                           ForEach(viewModel.recipes.filter { recipe in
                               selectedTag == nil || recipe.tags.contains(where: { $0.name == selectedTag })
                           }) { recipe in
                               VStack(alignment: .leading) {
                                   Text(recipe.name)
                                       .font(.headline)
                                   Text(recipe.description)
                                       .font(.subheadline)
                               }
                           }
                       }
                   }
                   .navigationTitle("Categories") // Başlık
               }
        }
    


#Preview {
    let viewModel = RecipeViewModel()
        
        return CategoriesDetail(viewModel: viewModel)
}
