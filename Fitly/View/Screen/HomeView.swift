//
//  HomeView.swift
//  Fitly
//
//  Created by IREM SEVER on 3.09.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("Welcome")
                    .font(.largeTitle)

                    .padding()
            }
            HStack {
                Spacer()
                VStack {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Calories")
                            .font(.callout)
                            .bold()
                            .foregroundColor(.red)
                        Text("1020 kcal")
                            .bold()
                    }
                    padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Active")
                            .font(.callout)
                            .bold()
                            .foregroundColor(.green)
                        Text("52 mins")
                            .bold()
                    }
                    padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Stand")
                            .font(.callout)
                            .bold()
                            .foregroundColor(.blue)
                        Text("8 hours")
                            .bold()
                    }
                }
                
                Spacer()
                
                ZStack {
                    ZStack {
                        Circle()
                            .stroke(.red.opacity(0.3), lineWidth: 20)
                        Circle()
                            .trim(from: 0, to: 0.3)
                            .stroke(.red, style: StrokeStyle(
                                lineWidth: 20,
                                lineCap: .round))
                            .rotationEffect(.degrees(-90))
                            .shadow(radius: 5)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
