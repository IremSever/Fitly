//
//  GenderInfo.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//

import SwiftUI

struct GenderInfo: View {
    @StateObject private var viewModel = OnboardingViewModel()
    var body: some View {
        VStack {
            Text("What's your gender?")
            Picker("Gender", selection: $viewModel.userData.gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Other").tag("Other")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
        .tag(2)
    }
}

#Preview {
    GenderInfo()
}
