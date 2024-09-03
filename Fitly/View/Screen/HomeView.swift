//
//  HomeView.swift
//  Fitly
//
//  Created by IREM SEVER on 3.09.2024.
//
import SwiftUI

struct HomeView: View {
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("Fitly")
                    .font(.largeTitle)
                    .padding()

                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Calories")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.red)
                            Text("1020 kcal")
                                .bold()
                        }
                        .padding(.bottom)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.green)
                            Text("52 mins")
                                .bold()
                        }
                        .padding(.bottom)

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
                        CircleProgressView(progress: $calories, goal: 600, color: .red)
                        CircleProgressView(progress: $active, goal: 60, color: .green)
                            .padding(.all, 20)
                        CircleProgressView(progress: $stand, goal: 10, color: .blue)
                            .padding(.all, 40)
                    }
                    .padding(.horizontal)
    
                    Spacer()
                }
                .padding()
            }
        }
    }
}
#Preview {
    HomeView()
}


