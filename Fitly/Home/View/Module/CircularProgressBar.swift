//
//  CircularProgressBar.swift
//  Fitly
//
//  Created by İrem Sever on 6.09.2024.
//

import SwiftUI

struct CircularProgressBar: View {
    
    var value: Double
    var total: Double
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 8)
                .opacity(0.3)
                .foregroundColor(.gray.opacity(0.5))
            Circle()
                .trim(from: 0.0, to: CGFloat(value / total))
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
         
        }
        .frame(width: 70, height: 70)
    }
}


#Preview {
    CircularProgressBar(value: 10.0, total: 20.0, color: .orange)
}
