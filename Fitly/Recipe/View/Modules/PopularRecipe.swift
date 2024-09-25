//
//  PopularRecipe.swift
//  Fitly
//
//  Created by İrem Sever on 20.09.2024.
//
import SwiftUI

struct PopularRecipe: View {

    @ObservedObject var viewModel: RecipeViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(viewModel.recipes) { recipe in
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.fitlyGreen.opacity(0.5))
                            .frame(width: 240, height: 300)
                            .overlay(
                                GeometryReader { geometry in
                                    ZStack {
                                        Path { path in
                                            let width = geometry.size.width
                                            let height: CGFloat = 9
                                            let arcWidth: CGFloat = 60
                                            
                                            path.move(to: CGPoint(x: (width - arcWidth) / 2, y: 30))
                                            path.addLine(to: CGPoint(x: (width - arcWidth) / 2 + arcWidth / 4, y: 30 - height))
                                            path.addLine(to: CGPoint(x: (width + arcWidth) / 2 - arcWidth / 4, y: 30 - height))
                                            path.addLine(to: CGPoint(x: (width + arcWidth) / 2, y: 30))
                                        }
                                        .fill(Color.white.opacity(1))
                                        
                                        Path { path in
                                            let width = geometry.size.width
                                            let arcWidth: CGFloat = 60
                                            let lineWidth = arcWidth * 0.6
                                            path.move(to: CGPoint(x: (width - lineWidth) / 2, y: 28))
                                            path.addLine(to: CGPoint(x: (width + lineWidth) / 2, y: 28))
                                        }
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                    }
                                }
                                    .frame(height: 30),
                                    alignment: .bottom
                                )
                        
                        VStack {
                            if let url = URL(string: recipe.image) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 230, height: 220)
                                
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 220, height: 220)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                            } else {
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 220, height: 220)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                            }
                            Text(recipe.name)
                                .font(.subheadline)
                                .frame(width: 220, height: 40)
                                .foregroundColor(.black)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .cornerRadius(25)
                                .padding([.bottom], 0)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    PopularRecipe(viewModel: RecipeViewModel())
}
