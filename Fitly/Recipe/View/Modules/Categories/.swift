//
//  CategoriesDetail 3.swift
//  Fitly
//
//  Created by İrem Sever on 25.09.2024.
//


import SwiftUI

struct CategoriesDetail: View {
    @ObservedObject var viewModel: RecipeViewModel
    var selectedTag: String?

    @State private var currentTag: String?

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(uniqueTags(), id: \.self) { tag in
                            Button(action: {
                                currentTag = tag
                                withAnimation {
                                    proxy.scrollTo(tag, anchor: .center)
                                }
                            }) {
                                Text(tag)
                                    .frame(width: 100, height: 50)  // Eşit genişlik ve yükseklik
                                    .padding()
                                    .font(.caption)
                                    .background(currentTag == tag ? Color.fitlyOrange.opacity(0.7) : Color.fitlyWhite.opacity(0.7))
                                    .foregroundColor(currentTag == tag ? Color.fitlyDarkGray.opacity(0.7) : Color.fitlyDarkGray.opacity(0.3))
                                    .cornerRadius(40)
                            }
                            .id(tag)  // Seçili kategoriyi ortalamak için gerekli
                        }
                    }
                    .onAppear {
                        if let selectedTag = selectedTag {
                            currentTag = selectedTag
                            withAnimation {
                                proxy.scrollTo(selectedTag, anchor: .center)  // Seçili tag'i ortala
                            }
                        }
                    }
                    .padding()
                }
            }

            List {
                ForEach(viewModel.recipes.filter { recipe in
                    currentTag == nil || recipe.tags.contains(where: { $0.name == currentTag })
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
        .navigationTitle("Categories")
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
    return CategoriesDetail(viewModel: viewModel, selectedTag: nil)
}
