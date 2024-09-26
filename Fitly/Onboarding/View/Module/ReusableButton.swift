//
//  ReusableButton.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//

import SwiftUI

struct ReusableButton: View {
    let label: String
    let isDisabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .padding()
                .background(isDisabled ? Color.fitlyWhite : Color.fitlyGreen)
                .foregroundColor(.black)
                .cornerRadius(30)
                .shadow(color: Color.gray.opacity(0.5), radius: 3)
        }
        .disabled(isDisabled)
    }
}

#Preview {
    ReusableButton(label: "Continue", isDisabled: false, action: {})
}

