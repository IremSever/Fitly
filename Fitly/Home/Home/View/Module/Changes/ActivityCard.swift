//
//  ActivityCard.swift
//  Fitly
//
//  Created by İrem Sever on 4.09.2024.
//

import SwiftUI

struct ActivityCard: View {
    var title: String
    var weight: Double
    var unit: String
    var change: Double
    var isBookmarked: Bool
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(title)
                                .font(.subheadline)
                                .foregroundColor(Color.black)
                            Spacer()
                            Image(isBookmarked ? "bookmark" : "power")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                                .padding(8)
                                .background(Color.white.opacity(0.8))
                                .clipShape(Circle())
                        }
                        Spacer()
                        
                        HStack(alignment: .firstTextBaseline) {
                            Text("\(String(format: "%.1f", weight))")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.black)
                            
                            Text(unit)
                                .font(.system(size: 11, weight: .light))
                                .foregroundColor(.gray)
                        }
                    }
                
                    Spacer()
                }
                
                Spacer(minLength: 10)
                
                HStack {
                    Image(systemName: change >= 0 ? "arrow.up.circle" : "arrow.down.circle")
                        .foregroundColor(change >= 0 ? .green : .red)
                    
                    Text("\(String(format: "%.1f", abs(change))) Kg (\(change >= 0 ? "+" : "-")\(String(format: "%.1f", abs(change)))%)")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
        }
        .background(Color.white)
        .cornerRadius(25)
    }
}

#Preview {
    ActivityCard(title: "Current Weight", weight: 78.5, unit: " kg", change: -3.8, isBookmarked: true) 
}
