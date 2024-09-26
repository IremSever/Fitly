//
//  Categories 2.swift
//  Fitly
//
//  Created by İrem Sever on 25.09.2024.
//


import SwiftUI

struct Categories: View {
    @ObservedObject var viewModel: RecipeViewModel
    @State private var selectedTag: String? = nil

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(uniqueTags(), id: \.self) { tag in
                            NavigationLink(destination: CategoriesDetail(viewModel: viewModel, selectedTag: tag)) {
                                Text(tag)
                                    .frame(width: 100, height: 50)  // Eşit genişlik ve yükseklik
                                    .padding()
                                    .background(selectedTag == tag ? Color.fitlyGreen : Color.fitlyYellow.opacity(0.7))
                                    .foregroundColor(.black)
                                    .cornerRadius(80)
                                    .font(.subheadline)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
                .navigationTitle("Categories")
            }
        }
    }

    private func uniqueTags() -> [String] {
        var tagsSet = Set<String>()
        for recipe in viewModel.recipes {
            for tag in recipe.tags {
                tagsSet.insert(tag.name)
            }
        }
        return Array(tagsSet).sorted()
    }
}

#Preview {
    let viewModel = RecipeViewModel()
    return Categories(viewModel: viewModel)
}
