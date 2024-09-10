//
//  MealCard.swift
//  Fitly
//
//  Created by İrem Sever on 6.09.2024.
//

import SwiftUI

struct MealCard: View {
    var mealName: String
    var calories: String
    var color: Color
    var nutritionalData: [String: Float]
    var addFoodAction: () -> Void
   
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.yellow)
                    .font(.largeTitle)

                VStack(alignment: .leading) {
                    Text(mealName)
                        .font(.title2)
                        .bold()
                    Text(calories)
                        .font(.subheadline)
                }

                Spacer()

                Button(action: addFoodAction) {
                    Image(systemName: "plus")
                        .font(.system(size: 30))
                        .foregroundColor(.yellow)
                        .bold()
                        .cornerRadius(30)
                }
            
            }
            .padding(.top)
            .padding(.horizontal)

            HStack {
                NutrientCard(label: "Proteins", value: nutritionalData["Proteins"] ?? 0.0)
                Spacer()
                NutrientCard(label: "Fats", value: nutritionalData["Fats"] ?? 0.0)
                Spacer()
                NutrientCard(label: "Carbs", value: nutritionalData["Carbs"] ?? 0.0)
            }
            .padding()
        }
        .padding(.bottom)
        .background(color)
        .cornerRadius(20)
        /*
         .background(.white)
                 .cornerRadius(20)
                 .overlay(
                     RoundedRectangle(cornerRadius: 20)
                         .stroke(color, lineWidth: 1)
                 )
         */
    }
}
#Preview {
    MealCard(mealName: "Breakfast",
             calories: "300 kcal",
             color: .green.opacity(0.2),
             nutritionalData: [
                "Proteins": 62.5,
                "Fats": 23.6,
                "Carbs": 45.7,
                "RDC": 14.0
             ], addFoodAction: {})
}
