//
//  HomeViewModel.swift
//  Fitly
//
//  Created by İrem Sever on 4.09.2024.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
    var mockActivites = [
        Activity(id: 0, title: "Today Steps", subTitle: "Goal 10000", image: "figure.walk", tintColor: .orange, amount: "6236"),
        Activity(id: 1, title: "Today Steps", subTitle: "Goal 1000", image: "figure.walk", tintColor: .purple, amount: "812"),
        Activity(id: 2, title: "Today Steps", subTitle: "Goal 10000", image: "figure.walk", tintColor: .yellow, amount: "9281"),
        Activity(id: 3, title: "Today Steps", subTitle: "Goal 50000", image: "figure.run", tintColor: .blue, amount: "100324"),
    ]
    
    var mockWorkout = [
        Workout(id: 0, title: "Running", image: "figure.run", duration: "48", date: "Aug 20", calories: "583", color: .purple),
        Workout(id: 1, title: "Strength Training", image: "figure.run", duration: "48", date: "Aug 20", calories: "583", color: .orange),
        Workout(id: 2, title: "Walk", image: "figure.walk", duration: "48", date: "Aug 20", calories: "583", color: .yellow),
        Workout(id: 3, title: "Running", image: "figure.run", duration: "48", date: "Aug 20", calories: "583", color: .blue),
    ]
}
