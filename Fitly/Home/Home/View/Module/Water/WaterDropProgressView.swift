//
//  WaterDropProgressView.swift
//  Fitly
//
//  Created by İrem Sever on 9.09.2024.
//

import Foundation
import SwiftUI

struct WaterDropProgressView: View {
    var progress: Double
    @State private var phase: CGFloat = 0

    var body: some View {
        ZStack {
           
           
            WaterDropShape()
                .stroke(lineWidth: 2)
                .foregroundColor(.white)
//                .fill(LinearGradient(gradient: Gradient(colors: [.cyan, .blue]), startPoint: .top, endPoint: .bottom))
                .frame(width: 85, height: 80)
//                .shadow(radius: 0.5)
            
            WaterDropShape()
                //.foregroundColor(.fitlyBlue)
                .fill(LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.8), .fitlyBlue.opacity(1)]), startPoint: .top, endPoint: .bottom))
                .opacity(1)
                .frame(width: 85, height: 80)
                .mask(
                    GeometryReader { geometry in
                        WaveShape(progress: progress, phase: phase)
                            .frame(width: geometry.size.width, height: geometry.size.height + 24)
                            .onAppear {
                                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                                    phase = .pi * 2
                                }
                            }
                    }
                )
            WaterDropShape()
                .stroke(lineWidth: 3)
                .foregroundColor(.gray)
//                .fill(LinearGradient(gradient: Gradient(colors: [.fitlyBlue.opacity(1), .fitlyBlue.opacity(1)]), startPoint: .top, endPoint: .bottom))
                .frame(width: 85, height: 80)
//                .shadow(radius: 0.5)
        }
    }
}
