//
//  WaterView.swift
//  Fitly
//
//  Created by İrem Sever on 10.09.2024.
//

import SwiftUI

struct WaterView: View {
    @State private var waterIntake: Int = 0
    @State private var waterGoal: Int = 2500
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Water")
                    .font(.subheadline)
                    .bold()
                Text("\(waterIntake) mL")
                    .font(.title2)
                    .bold()
                
                Text(" / \(waterGoal) mL")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                 
            }
            .padding(.horizontal)
         Spacer()
            HStack {
                Button(action: {
                    if waterIntake > 0 { waterIntake -= 100 }
                }) {
                    Image(systemName: "minus.circle")
                        .font(.title)
                        .foregroundColor(.fitlyDarkGray)
                
                }
                
                WaterDropProgressView(progress: Double(waterIntake) / Double(waterGoal))
                    .padding(.bottom)
                
                
                Button(action: {
                    if waterIntake < waterGoal { waterIntake += 100 }
                }) {
                    Image(systemName: "plus.circle")
                        .font(.title)
                        .foregroundColor(.fitlyDarkGray)
                }
                
         
               
            }
            
            
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
//        .shadow(radius: 3)
    }
}

#Preview {
    WaterView()
}
