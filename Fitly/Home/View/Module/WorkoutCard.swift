//
//  WorkoutCard.swift
//  Fitly
//
//  Created by İrem Sever on 4.09.2024.
//

import SwiftUI

struct WorkoutCard: View {
    @State var workout: Workout
    
    var body: some View {
        HStack {
            Image(systemName: workout.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundColor(workout.color)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 4)
            
            VStack(spacing: 16) {
                HStack {
                    Text(workout.title)
                        .bold()
                    Spacer()
                    Text(workout.duration)
                        .foregroundColor(.black)
                }
                HStack {
                    Text(workout.date)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(workout.calories) kcal")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(5)
    }
        
}

#Preview {
    WorkoutCard(workout: Workout(id: 0, title: "Running", image: "figure.run", duration: "48", date: "Aug 20", calories: "583", color:.fitlyRed))
}
