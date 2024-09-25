//
//  Calorie.swift
//  Fitly
//
//  Created by İrem Sever on 20.09.2024.
//

import SwiftUI

struct Calorie: View {
    var calorieLeft: Int = 1230
    var totalCalories: CGFloat = 2500
    var bluePart: CGFloat = 800
    var greenPart: CGFloat = 500
    var yellowPart: CGFloat = 300

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text("Calorie left")
                    .font(.title3)
                HStack {
                    Text("\(calorieLeft)")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.black)
                    Text("kcal")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .padding(.top)
                }
               
            }
            
       
            ZStack(alignment: .leading) {
       
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.fitlyWhite)
                    .frame(height: 30)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.fitlyYellow)
                    .frame(width: (yellowPart / totalCalories) * UIScreen.main.bounds.width * 0.9, height: 30)
                    .offset(x: ((bluePart + greenPart) / totalCalories) * UIScreen.main.bounds.width * 0.9)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.fitlyGreen)
                    .frame(width: (greenPart / totalCalories) * UIScreen.main.bounds.width * 0.9 + 10, height: 30)
                    .offset(x: (bluePart / totalCalories) * UIScreen.main.bounds.width * 0.9)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.fitlyBlue)
                    .frame(width: (bluePart / totalCalories) * UIScreen.main.bounds.width * 0.9 + 10, height: 30)
                
            }
            
        }
        .padding()

    }
}

#Preview {
    Calorie()
}
