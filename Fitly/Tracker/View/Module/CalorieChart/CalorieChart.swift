//
//  CalorieChart.swift
//  Fitly
//
//  Created by İrem Sever on 20.09.2024.
//

import SwiftUI

struct CalorieChart: View {
    let currentCalories: Int
    let totalCalories: Int
  
    var body: some View {
        VStack(alignment: .center) {
           
            VStack {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 10)
                        .foregroundColor(Color.fitlyOrange)
                    Circle()
                        .trim(from: 0.0, to: CGFloat(currentCalories) / CGFloat(totalCalories))
                        .stroke(
                            AngularGradient(gradient: Gradient(colors: [Color.white, Color.white]), center: .center),
                            style: StrokeStyle(lineWidth: 10, lineCap: .round)
                        )
                        .shadow(radius: 0.5)
                        .rotationEffect(Angle(degrees: -90))
                        
                    VStack {
                        Text("\(Int(currentCalories))")
                            .font(.title)
                        Text("kcal")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding()
            .frame(width: 150, height: 150) 
            .background(Color.fitlyWhite)
            .cornerRadius(20)
            
            Text("Calories")
                .font(.subheadline)
            
        }
        .frame(width: 150, height: 150) 
    }
}

#Preview {
    CalorieChart(currentCalories: 780, totalCalories: 1800)
}
