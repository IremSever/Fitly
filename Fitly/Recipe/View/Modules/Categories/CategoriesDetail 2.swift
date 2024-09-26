//
//  CategoriesDetail 2.swift
//  Fitly
//
//  Created by İrem Sever on 25.09.2024.
//


import SwiftUI

struct CategoriesDetail: View {
    @ObservedObject var viewModel: RecipeViewModel
    var selectedTag: String? 

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
            .padding()

            // Horizontal scroll view for tags
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(uniqueTags(), id: \.self) { tag in
                        Button(action: {
                            // Handle tag selection
                        }) {
                            Text(tag)
                                .padding()
                                .background(selectedTag == tag ? Color.fitlyGreen : Color.fitlyGreen.opacity(0.7))
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
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Categories") // Başlık
    }

    // Function to get unique tags
    private func uniqueTags() -> [String] {
        var tagsSet = Set<String>()
        for recipe in viewModel.recipes {
            for tag in recipe.tags {
                tagsSet.insert(tag.name)
            }
        }
        return Array(tagsSet).sorted() // Convert Set back to an array and sort it if needed
    }
}

#Preview {
    let viewModel = RecipeViewModel()
    return CategoriesDetail(viewModel: viewModel, selectedTag: nil) // Pass nil initially
}
