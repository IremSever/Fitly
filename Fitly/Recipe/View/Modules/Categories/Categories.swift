//
//  Categories.swift
//  Fitly
//
//  Created by İrem Sever on 20.09.2024.
//

import SwiftUI

struct Categories: View {
    @ObservedObject var viewModel: RecipeViewModel
    @State private var selectedTag: String? = nil
    
    var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.recipes.flatMap { $0.tags }, id: \.name) { tag in
                        Button(action: {
                            selectedTag = tag.name
                        }) {
                            Text(tag.name)
                                .frame(width: 50, height: 50)
                                .padding()
                                .background(Color.fitlyYellow.opacity(0.7))
                                .foregroundColor(.black)
                                .cornerRadius(80)
                                .font(.subheadline)
                            
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Categories")
            
        }
    }
    
    
}


#Preview {
    let viewModel = RecipeViewModel()
    return Categories(viewModel: viewModel)
}
