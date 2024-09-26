//
//  HomeView.swift
//  Fitly
//
//  Created by IREM SEVER on 3.09.2024.
//

import SwiftUI
struct HomeView: View {

    @StateObject var viewModel = HomeViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                HStack {
                    Image("pp")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("Hello, İrem!")
                            .font(.headline)
                        Text("12 March")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    HStack(spacing: 15) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                        Image(systemName: "bell")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
                
                VStack {
                    //calories chart
                    CircleProgressView(progress: .constant(viewModel.caloriesEaten), goal: viewModel.caloriesGoal, color: Color.fitlyWhite)
                        .padding()
        
                    HStack {
                        ActivityCard(title: "Current Weight", weight: 78.5, unit: " Kg", change: -3.8, isBookmarked: false)
                        
                        ActivityCard(title: "Today's Calories", weight: 1278, unit: " Kcal", change: +5.6, isBookmarked: true)
                    }
                    .padding(.horizontal)
                                        
                    VStack {
                        TabView {
                            MealCard(mealName: "Breakfast", calories: "350 calories", color:.fitlyGreen.opacity(0.4), nutritionalData: ["Proteins": 62.5, "Fats": 23.6, "Carbs": 45.7, "RDC": 14.0])
                        
                            MealCard(mealName: "Lunch", calories: "500 calories", color: .fitlyGreen.opacity(0.4), nutritionalData: ["Proteins": 45.0, "Fats": 30.0, "Carbs": 60.0, "RDC": 22.0])
                            
                            MealCard(mealName: "Dinner", calories: "600 calories", color: .fitlyGreen.opacity(0.4), nutritionalData: ["Proteins": 50.0, "Fats": 35.0, "Carbs": 70.0, "RDC": 25.0])
                            
                            MealCard(mealName: "Snacks", calories: "200 calories", color:.fitlyGreen.opacity(0.4), nutritionalData: ["Proteins": 10.0, "Fats": 15.0, "Carbs": 20.0, "RDC": 8.0])
                        }
                        
                        .frame(height: 209)
                        .padding(.vertical)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        
                        
                        
                        WaterView()
                            .padding(.horizontal, 20)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

