//
//  WaterDropShape.swift
//  Fitly
//
//  Created by İrem Sever on 9.09.2024.
//

import Foundation
import SwiftUI

struct WaterDropShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.width / 2, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height * 0.75),
                          control: CGPoint(x: rect.width, y: rect.height * 0.4))
        path.addArc(center: CGPoint(x: rect.width / 2, y: rect.height * 0.75),
                    radius: rect.width / 2,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        path.addQuadCurve(to: CGPoint(x: rect.width / 2, y: 0),
                          control: CGPoint(x: 0, y: rect.height * 0.4))
        return path
    }
}

