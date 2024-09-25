//
//  Nutrition.swift
//  Fitly
//
//  Created by İrem Sever on 20.09.2024.
//

import SwiftUI

struct Nutrition: View {
    var value: CGFloat
    var total: CGFloat
    var label: String
    var displayValue: String

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
        
                Capsule()
                    .fill(Color.fitlyWhite)
                    .frame(width: 60, height: 120)
              
                Capsule()
                    .fill(Color.fitlyGreen)
                    .frame(width: 60, height: max((value / total) * 120, 60))
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 50, height: 50)
                    .overlay(
                        Text(displayValue)
                            .font(.subheadline)
                    )
                    .offset(y: min(max(-((value / total) * 120), -120) + 55, -5))
            }

            Text(label)
                .font(.subheadline)
                .padding(.top, 3)
        }
    }
}


#Preview {
    Nutrition(value: 150, total: 200, label: "Cal", displayValue: "1234")
}

