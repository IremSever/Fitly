//
//  NutrientCard.swift
//  Fitly
//
//  Created by İrem Sever on 7.09.2024.
//

import SwiftUI

struct NutrientCard: View {
    var label: String
        var value: Float

        var body: some View {
            VStack {
                Text(label)
                    .font(.subheadline)
                  
                Text("\(value, specifier: "%.1f")g")
                    .font(.title2)
                    .bold()
            }
        }
    }

