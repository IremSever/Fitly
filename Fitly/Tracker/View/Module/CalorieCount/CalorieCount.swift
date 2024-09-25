//
//  CalorieCount.swift
//  Fitly
//
//  Created by İrem Sever on 20.09.2024.
//

import SwiftUI

struct CalorieCount: View {
    var body: some View {
        HStack {
  
            Circle()
                .stroke(Color.fitlyYellow, lineWidth: 3)
                .frame(width: 30, height: 10)
                .overlay(
                    Image("checklist")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .opacity(1)
                        .padding(15)
                        .background(Color.white.opacity(1))
                        .clipShape(Circle())
                )
            
            Spacer()
            
            HStack {
                Text("Calorie count")
                    .font(.title3)
                    .foregroundColor(.black)
                
                HStack {
                    Image(systemName: "chevron.right")
                        .frame(width: 10, height: 10)
                        .opacity(0.3)
                        .padding(.horizontal, 1)
                    Image(systemName: "chevron.right")
                        .frame(width: 10, height: 10)
                        .opacity(0.5)
                        .padding(.horizontal, 1)
                    Image(systemName: "chevron.right")
                        .frame(width: 10, height: 10)
                        .opacity(1)

                }
                
                
            }.padding()
            
            Spacer()
            
            Circle()
                .stroke(Color.fitlyYellow.opacity(0.1), lineWidth: 3)
                .frame(width: 50, height: 50)
                .overlay(
                    Image("checklist")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .opacity(0.4)
                        .padding(15)
                        .background(Color.white.opacity(1))
                        .clipShape(Circle())
                )
        }
        .padding()
        .background(Color.fitlyYellow.opacity(0.7))
        .frame(height: 60)
        .cornerRadius(30)
        
      
    }
}

#Preview {
    CalorieCount()
}
