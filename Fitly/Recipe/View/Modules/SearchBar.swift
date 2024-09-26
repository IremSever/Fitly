//
//  SearchBar.swift
//  Fitly
//
//  Created by İrem Sever on 20.09.2024.
//

import SwiftUI

struct SearchBar: View {
    @ObservedObject var viewModel: RecipeViewModel
    @State private var searchText = ""
    var body: some View {
        
        ZStack {
            TextField("", text: $searchText)
                .padding(10)
                .font(.caption)
                .background(Color.fitlyWhite.opacity(0.7))
                .cornerRadius(10)
            HStack {
                Spacer()
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.fitlyDarkGray)
                    .padding()
                
            }
           
        }
        .padding()
    }
}

#Preview {
    let viewModel = RecipeViewModel()
    return SearchBar(viewModel: viewModel)
}
