//
//  StepProgressView.swift
//  Fitly
//
//  Created by İrem Sever on 10.09.2024.
//

import Foundation
import SwiftUI

struct StepProgressView: View {
    var progress: Double
    var body: some View {
        ZStack {
   
            Circle()
                .stroke(lineWidth: 10)
                .foregroundColor(.orange.opacity(0.2))

           
            Circle()
                .trim(from: 0.0, to: min(CGFloat(progress), 1.0))
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .fill(LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
                .shadow(radius: 1)

           
            NeedleView(progress: progress)
                .frame(width: 100, height: 100)

            // percent
//            Text(String(format: "%.0f%%", min(progress, 1.0) * 100.0))
//                .font(.title2)
//                .bold()
//                .foregroundColor(.orange)
            
            Circle()
                .stroke(lineWidth: 2)
                .fill(LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom))
                .frame(width: 7, height: 7)
                .shadow(radius: 0.05)
       

        }
        .frame(width: 100, height: 100)
    }
}

