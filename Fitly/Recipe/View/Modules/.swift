//
//  RecipeDetailIngredients.swift
//  Fitly
//
//  Created by İrem Sever on 21.09.2024.
//

import Foundation
import SwiftUI

struct RecipeDetailIngredients: View {
    @Environment(\.colorScheme) var colorScheme
    let recipes: RecipeModel

    var body: some View {
        
        if let ingredients = recipes.ingredients {
            LazyVStack(spacing: 12) {
                ForEach(Array(ingredients), id: \.key) { key, value in
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 375, height: 60)
                        .foregroundColor(.white)
                        .background(
                            GeometryReader { geometry in
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.white)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .shadow(radius: 2, x: 0, y: 2)
                            }
                        )
                        .overlay {
                            HStack {
                                Text(key)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(value)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                            }
                            .padding()
                            .foregroundColor(.black)
                        }
                }
            }
        }
    }
}
#Preview {
    RecipeDetailIngredients(recipes: MockData().recipe.meals[0])
}
