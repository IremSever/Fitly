//
//  WeightProgressBar.swift
//  Fitly
//
//  Created by İrem Sever on 10.09.2024.
//

import Foundation
import SwiftUI

struct WeightProgressBar: View {
    var weightProgress: Double

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.orange.opacity(0.2))
            
            RoundedRectangle(cornerRadius: 5)
                .fill(LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom))
                .frame(width: CGFloat(weightProgress) * UIScreen.main.bounds.width * 0.4)
                .shadow(radius: 0.5)
        }
    }
}
