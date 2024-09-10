//
//  NeedleView.swift
//  Fitly
//
//  Created by İrem Sever on 10.09.2024.
//

import Foundation
import SwiftUI

struct NeedleView: View {
    var progress: Double

    var body: some View {
        GeometryReader { geometry in
            let radius = min(geometry.size.width, geometry.size.height) / 2
            let angle = Angle(degrees: 360 * progress)

            ZStack {
                Capsule()
                    .fill(LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom))
                    .frame(width: 5, height: 35)
                    .cornerRadius(2.5)
                    .offset(y: -radius / 2)
                    .rotationEffect(angle)
                    .shadow(radius: 0.05)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
