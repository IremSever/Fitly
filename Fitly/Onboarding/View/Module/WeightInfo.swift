//
//  WeightInfo.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//

import SwiftUI

struct WeightInfo: View {
    @StateObject private var viewModel = OnboardingViewModel()
    var body: some View {
        VStack {
            Text("What's your weight? (kg)")
            Slider(value: Binding(
                get: { viewModel.userData.weight ?? 65 },
                set: { viewModel.userData.weight = $0 }
            ), in: 30...200, step: 1)
            Text("Weight: \(Int(viewModel.userData.weight ?? 65)) kg")
        }
        .tag(4)
    }
}

#Preview {
    WeightInfo()
}
