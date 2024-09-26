//
//  OnboardingView.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
import Foundation
import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()

    var body: some View {
        VStack {
            TabView(selection: $viewModel.userData.currentIndex) {
                VStack {
                    Spacer()
                    NameInfo()
                    Spacer()
                    ReusableButton(
                        label: "Continue",
                        isDisabled: viewModel.userData.name.isEmpty,
                        action: nextStep
                    )
                    .padding(.bottom, 50)
                }
                .tag(0)
                
    
                VStack {
                    Spacer()
                    AgeInfo()
                    Spacer()
                    ReusableButton(
                        label: "Continue",
                        isDisabled: viewModel.userData.age == nil,
                        action: nextStep
                    )
                    .padding(.bottom, 50)
                }
                .tag(1)
                
              
                VStack {
                    Spacer()
                    GenderInfo()
                    Spacer()
                    ReusableButton(
                        label: "Continue",
                        isDisabled: viewModel.userData.gender.isEmpty,
                        action: nextStep
                    )
                    .padding(.bottom, 50)
                }
                .tag(2)
                
                VStack {
                    Spacer()
                    HeightInfo()
                    Spacer()
                    ReusableButton(
                        label: "Continue",
                        isDisabled: false,
                        action: nextStep
                    )
                    .padding(.bottom, 50)
                }
                .tag(3)
                
                VStack {
                    Spacer()
                    WeightInfo()
                    Spacer()
                    ReusableButton(
                        label: "Continue",
                        isDisabled: false,
                        action: nextStep
                    )
                    .padding(.bottom, 50)
                }
                .tag(4)
                
                VStack {
                    Spacer()
                    GoalWeightInfo()
                    Spacer()
                    ReusableButton(
                        label: "Finish",
                        isDisabled: false,
                        action: {
                            viewModel.saveUserDataToFile()
                        }
                    )
                    .padding(.bottom, 50)
                }
                .tag(5)
            }
            .tabViewStyle(PageTabViewStyle())
        
            if viewModel.isLoading {
                ProgressView("Loading...")
            }
        }
        .padding()
    }

    func nextStep() {
        if viewModel.userData.currentIndex < 5 {
            viewModel.userData.currentIndex += 1
        }
    }
}

#Preview {
    OnboardingView()
}
