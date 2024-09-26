//
//  GoalWeightInfo.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//

import SwiftUI

struct GoalWeightInfo: View {
    @StateObject private var viewModel = OnboardingViewModel()
    var body: some View {
        VStack {
            Text("What's your goal weight? (kg)")
            Slider(value: Binding(
                get: { viewModel.userData.goalWeight ?? 65 },
                set: { viewModel.userData.goalWeight = $0 }
            ), in: 30...200, step: 1)
            Text("Goal Weight: \(Int(viewModel.userData.goalWeight ?? 65)) kg")
        }
        .tag(5)
    }
}

#Preview {
    GoalWeightInfo()
}
