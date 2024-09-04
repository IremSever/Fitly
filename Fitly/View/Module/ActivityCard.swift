//
//  ActivityCard.swift
//  Fitly
//
//  Created by İrem Sever on 4.09.2024.
//

import SwiftUI

struct Activity {
    let id: Int
    let title: String
    let subTitle: String
    let image: String
    let tintColor: Color
    let amount: String
}

struct ActivityCard: View {
    @State var activity: Activity
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(activity.title)
                            .font(.title3)
                        Text(activity.subTitle)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Image(systemName: activity.image)
                        .foregroundColor(activity.tintColor)
                }
                Text(activity.amount)
                    .font(.title)
                    .bold()
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ActivityCard(activity: Activity(id: 0, title: "Today Steps", subTitle: "Goal 10000", image: "figure.walk", tintColor: .orange, amount: "6236"))
}
