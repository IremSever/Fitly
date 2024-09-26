//
//  HeightInfo.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//

import SwiftUI

struct HeightInfo: View {
    @StateObject private var viewModel = OnboardingViewModel()
    var body: some View {
        VStack {
            Text("How tall are you? (cm)")
            Slider(value: Binding(
                get: { viewModel.userData.height ?? 160 },
                set: { viewModel.userData.height = $0 }
            ), in: 120...250, step: 1)
            Text("Height: \(Int(viewModel.userData.height ?? 160)) cm")

        }
        .tag(3)
    }
}

#Preview {
    HeightInfo()
}
