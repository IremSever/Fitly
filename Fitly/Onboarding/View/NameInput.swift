//
//  NameInput.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//

import SwiftUI

struct NameInput: View {
    @State private var name = ""

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    Text("What's your name?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
              
                    Button(name) {
                    }
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 200, height: 70)
                    .background(Color.fitlyYellow.opacity(0.7))
                    .cornerRadius(50)

                Spacer()
                    Button("Continue") {
                    }
                    .padding()
                    .foregroundColor(.fitlyDarkGray)
                    .background(Color.fitlyWhite)
                    .cornerRadius(50)
                }
            }
            .navigationBarHidden(true)
            
        }
    }


#Preview {
    NameInput()
}
