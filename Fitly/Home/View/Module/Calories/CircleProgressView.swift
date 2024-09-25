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
    
    private let lineWidth: CGFloat = 12
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.fitlyBlue.opacity(0.7))
                .overlay(
                    GeometryReader { geometry in
                        Path { path in
                            let width = geometry.size.width
                            let height: CGFloat = 9
                            let arcWidth: CGFloat = 60
                            
                            //hexagon shape
                            path.move(to: CGPoint(x: (width - arcWidth) / 2, y: 0))
                            path.addLine(to: CGPoint(x: (width - arcWidth) / 2 + arcWidth / 4, y: height))
                            path.addLine(to: CGPoint(x: (width + arcWidth) / 2 - arcWidth / 4, y: height))
                            path.addLine(to: CGPoint(x: (width + arcWidth) / 2, y: 0))
                        }
                        .fill(Color.white.opacity(1))
                        
                        Path { path in
                            let width = geometry.size.width
                            let arcWidth: CGFloat = 60
                            //path line
                            let lineWidth = arcWidth * 0.6
                            path.move(to: CGPoint(x: (width - lineWidth) / 2, y: 2))
                            path.addLine(to: CGPoint(x: (width + lineWidth) / 2, y: 2))
                        }
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    }
                        .frame(height: 30),
                    alignment: .top
                )
            
            
            HStack {
                Spacer()
                VStack {
                    HStack{
                        Image("statistics")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                            .padding(5)
                            .background(Color.white.opacity(1))
                            .clipShape(Circle())
                        
                        
                        Text("Your Progress")
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                        Spacer()
                    }
                    
                    HStack{
                        
                        Text("\(Int((Double(progress) / Double(goal)) * 100))%")
                            .font(.system(size: 40, weight: .bold))
                            .padding(.vertical)
                        Spacer()
                    }
                    
                    HStack {
                        Text("12 March")
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                        
                        Image(systemName: "chevron.down")
                            .font(.subheadline)
                            .fontWeight(.light)
                            .foregroundColor(Color.fitlyDarkGray)
                        Spacer()
                    }.padding(.vertical, 10)
                    
                    
                }
                .padding()
                Spacer()
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.4))
                        .frame(width: 100, height: 100)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 80, height: 80)
                    
                    Circle()
                        .trim(from: 1/4, to: 1)
                    
                        .stroke(Color.fitlyWhite, style: StrokeStyle(
                            lineWidth: lineWidth,
                            lineCap: .round))
                        .rotationEffect(.degrees(45))
                        .frame(width: 150, height: 150)
                    
                    
                    
                    VStack {
                        Text("\(Int(progress))")
                            .font(.title2)
                            .bold()
                        
                        Text("Calories")
                            .font(.subheadline)
                    }
                    
                    
                    ZStack{
                        Ellipse()
                            .fill(Color.yellow)
                            .frame(width: 20, height: 15)
                            .offset(y: -75)
                            .rotationEffect(.degrees(Double(progress / goal) * 360))
                        
                        Image("wave")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .offset(y: -75)
                            .opacity(0.7)
                        
                    }
                    
                }
                .padding()
                
                Spacer()
                
            }
        }
        
    }
}



#Preview {
    CircleProgressView(progress: .constant(1350), goal: 1500, color: .green)
      
}
