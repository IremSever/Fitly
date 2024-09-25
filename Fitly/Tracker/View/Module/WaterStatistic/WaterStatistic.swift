//
//  WaterStatistic.swift
//  Fitly
//
//  Created by İrem Sever on 20.09.2024.
//

import SwiftUI

struct WaterStatistic: View {

    let waterData: [CGFloat] = [1.5, 2.2, 1.0, 1.8, 2.4, 1.5, 2.5]
    let dailyWaterGoal: CGFloat = 2.5
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                ForEach(0..<7, id: \.self) { index in
                    VStack {
                        Text(getDayLabel(for: index))
                            .font(.caption)
                            .foregroundColor(.fitlyDarkGray)
                        
                        ZStack(alignment: .bottom) {
                            Capsule()
                                .fill(Color.white.opacity(0.2))
                                .frame(width: 6, height: 100)
                            
                            Capsule()
                                .fill(index == 5 ? Color.white : Color.white.opacity(0.7))
                                .frame(width: 6, height: CGFloat(waterData[index] / dailyWaterGoal) * 100)
                        }
                    }
                }
            }
            .padding()
            .background(Color.fitlyBlue.opacity(0.7))
            .cornerRadius(25)
            .frame(width: 150, height: 150)
            
            Text("Water")
                .font(.subheadline)
        }
        .frame(width: 150, height: 150)
    }
    
    func getDayLabel(for index: Int) -> String {
        let dayLabels = ["M", "T", "W", "T", "F", "S", "S"]
        return dayLabels[index]
    }
}


#Preview {
    WaterStatistic()
}

