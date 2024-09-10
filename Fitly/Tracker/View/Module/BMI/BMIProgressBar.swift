//
//  BMIProgressBar.swift
//  Fitly
//
//  Created by İrem Sever on 10.09.2024.
//

import Foundation
import SwiftUI

struct BMIProgressBar: View {
    let bmi: Double

    var body: some View {
        VStack {
            HStack(spacing: 3) {
                Color.purple.frame(width: 20, height: 10) // severely underweight
                    .cornerRadius(5)
                Color.blue.frame(width: 25, height: 10) // underweight
                    .cornerRadius(5)
                Color.cyan.frame(width: 30, height: 10) // underweight
                    .cornerRadius(5)
                Color.green.frame(width: 60, height: 10) // normal
                    .cornerRadius(5)
                Color.yellow.frame(width: 50, height: 10) // overweight
                    .cornerRadius(5)
                Color.orange.frame(width: 40, height: 10) // obese
                    .cornerRadius(5)
                Color.pink.frame(width: 25, height: 10) // obese
                    .cornerRadius(5)
                Color.red.frame(width: 20, height: 10) // severely Obese
                    .cornerRadius(5)
            }
           
            GeometryReader { geometry in
                           let totalWidth = geometry.size.width
                           
                           HStack {
                               Spacer()
                               
                               Image(systemName: "arrowtriangle.up.fill")
                                   .foregroundColor(getArrowColor(for: bmi))
                                   .offset(x: getOffset(for: bmi, in: totalWidth))
                               
                               Spacer()
                           }
                       }
                       .frame(height: 20)
                   }
               }

               
               private func getOffset(for bmi: Double, in totalWidth: CGFloat) -> CGFloat {
                   let bmiRanges: [(range: ClosedRange<Double>, width: CGFloat)] = [
                       (15.0...16.0, 20),
                       (16.0...18.5, 25),
                       (18.5...20.0, 30),
                       (20.0...25.0, 60),
                       (25.0...30.0, 50),
                       (30.0...35.0, 40),
                       (35.0...40.0, 25),
                       (40.0...45.0, 20)
                   ]
                   
                   let bmiMin: Double = 15.0
                   let bmiMax: Double = 45.0
                   let normalizedBMI = (bmi - bmiMin) / (bmiMax - bmiMin)
                   let totalBarWidth = bmiRanges.reduce(0) { $0 + $1.width }
                   
                   let proportionalOffset = CGFloat(normalizedBMI) * totalBarWidth
                   return proportionalOffset - (totalBarWidth / 2)
               }

               private func getArrowColor(for bmi: Double) -> Color {
                   switch bmi {
                   case ..<16.0:
                       return .purple
                   case 16.0..<18.5:
                       return .blue
                   case 18.5..<20.0:
                       return .cyan
                   case 20.0..<25.0:
                       return .green
                   case 25.0..<30.0:
                       return .yellow
                   case 30.0..<35.0:
                       return .orange
                   case 35.0..<40.0:
                       return .pink
                   default:
                       return .red 
                   }
               }
           }
