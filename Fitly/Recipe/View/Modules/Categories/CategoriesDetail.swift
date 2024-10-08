//
//  CategoriesDetail.swift
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
                                    .frame(width: 80, height: 30)
                                    .padding()
                                    .font(.caption)
                                    .background(currentTag == tag ? Color.fitlyBlue.opacity(0.7) : Color.fitlyWhite.opacity(0.7))
                                    .foregroundColor(currentTag == tag ? Color.fitlyDarkGray.opacity(1) : Color.fitlyDarkGray.opacity(0.5))
                                    .cornerRadius(40)
                            }
                            .id(tag)
                        }
                    }
                    .onAppear {
                        if let selectedTag = selectedTag {
                            currentTag = selectedTag
                            withAnimation {
                                proxy.scrollTo(selectedTag, anchor: .center)
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
