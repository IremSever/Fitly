//
//  MealView.swift
//  Fitly
//
//  Created by İrem Sever on 6.09.2024.
//

import SwiftUI

struct MealView: View {
    var mealName: String
    var calories: String
    var addFoodAction: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "fork.knife")
                .foregroundColor(.green.opacity(0.5))
            Text(mealName)
                .foregroundColor(.black)
            Spacer()
            Text(calories)
                .foregroundColor(.gray)
            Button(action: addFoodAction) {
                Image(systemName: "plus")
                    .font(.system(size: 20))
                    .foregroundColor(.pink)
            }
        }
        .padding()
        .background(Color.green.opacity(0.05))
        .cornerRadius(20)
    }
}

#Preview {
    Meal(activity: Activity(id: 0, title: "Today Steps", subTitle: "Goal 10000", image: "figure.walk", tintColor: .orange, amount: "6236"))
}
