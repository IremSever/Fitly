//
//  MealSearchBar.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//

import SwiftUI

struct MealSearchBar: View {
    @ObservedObject var viewModel: MealViewModel
    @State var searchText = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.fitlyDarkGray)
                    .frame(width: 15, height: 15)
                    .padding(9)
                    .background(Color.fitlyWhite.opacity(1))
                    .clipShape(Circle())
                    .bold()
                
                TextField("What are you looking for?", text: $searchText)
                    .padding(10)
                    .background(Color.fitlyWhite.opacity(1))
                    .cornerRadius(10)
                    .font(.caption)
                    .focused($isFocused)
                    .onChange(of: searchText) { newValue in
                        viewModel.filterMeals(with: newValue)
                    }
            }
            .padding(.horizontal)
            .onTapGesture {
                isFocused = true
            }
            
            List(viewModel.filteredMeals) { meal in
                HStack {
                    VStack(alignment: .leading) {
                        Text(meal.name)
                            .font(.subheadline)
                        Text("\(meal.calories) calories")
                            .font(.caption2)
                            .foregroundColor(.fitlyDarkGray)
                    }
                    Spacer()
                    Image("plus")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.fitlyDarkGray)
                        .opacity(0.8)
                        .padding(8)
                        .background(Color.fitlyGreen.opacity(1))
                        .clipShape(Circle())
                        .bold()
                }
                .listRowSeparator(.hidden)
                .background(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .onAppear {
                loadMeals()
            }
        }
        .gesture(
            TapGesture()
                .onEnded {
                    isFocused = false
                }
        )
    }

    func loadMeals() {
        viewModel.parseJSON(resourceName: "meal") { success in
            if !success {
                print("Failed to load meals.")
            }
        }
    }
}

#Preview {
    let viewModel = MealViewModel()
    MealSearchBar(viewModel: viewModel)
}
