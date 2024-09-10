//
//  WaveShape.swift
//  Fitly
//
//  Created by İrem Sever on 9.09.2024.
//

import Foundation
import SwiftUI
struct WaveShape: Shape {
    var progress: Double
    var waveHeight: CGFloat = 2
    var phase: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let progressHeight = CGFloat(1 - progress) * rect.height
        let wavelength = rect.width / 2
        
        path.move(to: CGPoint(x: 0, y: progressHeight))
        
        for x in stride(from: 0, through: rect.width, by: 1) {
            let relativeX = x / wavelength
            let sine = sin(relativeX * .pi * 2 + phase)
            let y = progressHeight + sine * waveHeight
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}
