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
                .stroke(lineWidth: 8)
                .foregroundColor(.white)
//                .fill(LinearGradient(gradient: Gradient(colors: [.cyan, .blue]), startPoint: .top, endPoint: .bottom))
                .frame(width: 85, height: 80)
                .shadow(radius: 0.5)
            
            WaterDropShape()
                .fill(LinearGradient(gradient: Gradient(colors: [.cyan.opacity(0.6), .blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom))
                .opacity(0.9)
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
                .stroke(lineWidth: 4)
//                .foregroundColor(.blue)
                .fill(LinearGradient(gradient: Gradient(colors: [.cyan.opacity(0.6), .blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom))
                .frame(width: 85, height: 80)
                .shadow(radius: 0.5)
        }
    }
}
