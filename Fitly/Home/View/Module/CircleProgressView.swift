//
//  CircleProgressView.swift
//  Fitly
//
//  Created by İrem Sever on 4.09.2024.
//

import SwiftUI
struct CircleProgressView: View {
    @Binding var progress: Int
    var goal: Int
    var color: Color
    
    private let width = 20
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.3), lineWidth: 20)
            Circle()
                .trim(from: 0, to: CGFloat(progress) / CGFloat(goal))
                .stroke(color, style: StrokeStyle(
                    lineWidth: 20,
                    lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
        }
        .padding()
    }
}

#Preview {
    CircleProgressView(progress: .constant(1500), goal: 2700, color: .green)
}
