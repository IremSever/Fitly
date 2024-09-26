//
//  MealCard 2.swift
//  Fitly
//
//  Created by İrem Sever on 25.09.2024.
//


import SwiftUI

struct MealCard: View {
    var mealName: String
    var calories: String
    var color: Color
    var nutritionalData: [String: Float]

    @State private var isNavigating: Bool = false  // Navigasyon durumu

    var mealImageName: String {
        switch mealName {
        case "Breakfast":
            return "sunrise"
        case "Lunch":
            return "sun"
        case "Dinner":
            return "sunset"
        case "Snacks":
            return "nachos"
        default:
            return "sun"
        }
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.fitlyYellow.opacity(0.5))
                .overlay(
                    GeometryReader { geometry in
                        ZStack {
                            Path { path in
                                let width = geometry.size.width
                                let height: CGFloat = 9
                                let arcWidth: CGFloat = 60

                                path.move(to: CGPoint(x: (width - arcWidth) / 2, y: 30))
                                path.addLine(to: CGPoint(x: (width - arcWidth) / 2 + arcWidth / 4, y: 30 - height))
                                path.addLine(to: CGPoint(x: (width + arcWidth) / 2 - arcWidth / 4, y: 30 - height))
                                path.addLine(to: CGPoint(x: (width + arcWidth) / 2, y: 30))
                            }
                            .fill(Color.white.opacity(1))

                            Path { path in
                                let width = geometry.size.width
                                let arcWidth: CGFloat = 60
                                let lineWidth = arcWidth * 0.6
                                path.move(to: CGPoint(x: (width - lineWidth) / 2, y: 28))
                                path.addLine(to: CGPoint(x: (width + lineWidth) / 2, y: 28))
                            }
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        }
                    }
                    .frame(height: 30),
                    alignment: .bottom
                )

            VStack(alignment: .leading) {
                HStack {
                    Image(mealImageName)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                        .opacity(0.8)
                        .padding(5)
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text(mealName)
                            .font(.title2)
                            .bold()
                        Text(calories)
                            .font(.subheadline)
                    }

                    Spacer()

                    // NavigationLink to MealListView
                    NavigationLink(destination: MealListView(), isActive: $isNavigating) {
                        Button(action: {
                            isNavigating = true  // Butona basıldığında navigasyon başlat
                        }) {
                            Image("plus")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.gray)
                                .opacity(0.8)
                                .padding(8)
                                .background(Color.white.opacity(1))
                                .clipShape(Circle())
                        }
                    }
                }
                .padding(.horizontal)

                HStack {
                    NutrientCard(label: "Proteins", value: nutritionalData["Proteins"] ?? 0.0)
                    Spacer()
                    NutrientCard(label: "Fats", value: nutritionalData["Fats"] ?? 0.0)
                    Spacer()
                    NutrientCard(label: "Carbs", value: nutritionalData["Carbs"] ?? 0.0)
                }
                .padding()

                HStack {
                    ZStack {
                        Color(.white)
                            .cornerRadius(20)
                            .frame(width: 150, height: 30)
                        Text("Today")
                            .foregroundColor(.black)
                            .padding(.horizontal, 10)
                    }

                    Spacer()

                    ZStack {
                        Color(.white)
                            .clipShape(Circle())
                            .frame(width: 40, height: 40)
                        Image("edit-text")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .opacity(0.7)
                            .padding(8)
                    }
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .padding(.horizontal)
        .frame(height: 180)
    }
}

// Example MealListView
struct MealListView: View {
    var body: some View {
        Text("Meal List View")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    MealCard(mealName: "Dinner", calories: "500kcal", color: .yellow.opacity(0.2), nutritionalData: ["Proteins": 62.5, "Fats": 36.7, "Carbs": 28.9, "RDC": 12.5])
}
