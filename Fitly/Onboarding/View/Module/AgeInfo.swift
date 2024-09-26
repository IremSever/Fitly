//
//  AgeInfo.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//

import SwiftUI

struct AgeInfo: View {
    @StateObject private var viewModel = OnboardingViewModel()
    var body: some View {
        VStack {
            Text("How old are you?")
            TextField("Age", value: $viewModel.userData.age, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

           
        }
        .tag(1)
    }
}

#Preview {
    AgeInfo()
}
