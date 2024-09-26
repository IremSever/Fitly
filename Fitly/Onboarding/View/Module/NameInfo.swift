//
//  NameInfo.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//

import SwiftUI

struct NameInfo: View {
    @StateObject private var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack {
            Text("What's your name?")
                .font(.headline)
                .padding(.bottom, 20)

            TextField("Name", text: $viewModel.userData.name)
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.5), radius: 5)
                )
                .padding(.horizontal, 50)
        }
        .tag(0)
    }
}

#Preview {
    NameInfo()
}
