//
//  HomeView.swift
//  Fitly
//
//  Created by IREM SEVER on 3.09.2024.
//

import SwiftUI
struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    //date
                    HStack {
                        Spacer()
                        Button(action: { /* action here */ }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text("Today, Dec 22")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Spacer()
                        Button(action: { /* action here */ }) {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                    }

                    //calories chart
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "fork.knife")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 23, height: 23)
                                .foregroundColor(.green)
                            
                            Text("Eaten")
                                .font(.headline)
                            
                            Text("\(viewModel.caloriesEaten) kcal")
                                .font(.subheadline)
                        }
                        Spacer()
                        
                        ZStack {
                            CircleProgressView(progress: .constant(viewModel.protein), goal: 143, color: .red)
                                .frame(width: 200, height: 200)
                            VStack {
                                Text("\(viewModel.caloriesEaten)")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Text("kcal left")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Spacer()
                        VStack {
                            Image(systemName: "flame.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.orange)
                            
                            Text("Burned")
                                .font(.headline)
                            
                            Text("\(viewModel.caloriesBurned) kcal")
                                .font(.subheadline)
                        }
                        Spacer()
                    }
        
                    //carbs, protein, fat chart
                    VStack{
                        HStack {
                            Rectangle()
                                .frame(width: 80, height: 1)
                                .foregroundColor(.gray.opacity(0.5))
                            
                            Text("Eaten")
                                .font(.caption)
                                .foregroundColor(.gray.opacity(0.8))
                                .bold()
                            
                            Rectangle()
                                .frame(width: 80, height: 1)
                                .foregroundColor(.gray.opacity(0.5))
                        }
                        .padding(.bottom)
                        
                        HStack {
                            Spacer()
                            VStack {
                                ZStack {
                                    CircularProgressBar(value: Double(viewModel.carbs), total: 224, color: .yellow)
                                    VStack {
                                        Text("\(viewModel.carbs)g")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                            .bold()
                                        Text("/ 224g")
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                }
                                Text("Carbs")
                                    .font(.subheadline)
                            }
                            Spacer(minLength: 60)
                            
                            VStack {
                                ZStack {
                                    CircularProgressBar(value: Double(viewModel.protein), total: 128, color: .indigo)
                                    VStack {
                                        Text("\(viewModel.protein)g")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                            .bold()
                                        Text("/ 128g")
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                }
                                Text("Protein")
                                    .font(.subheadline)
                            }
                            Spacer(minLength: 60)
                            
                            VStack {
                                ZStack {
                                    CircularProgressBar(value: Double(viewModel.fat), total: 128, color: .cyan)
                                    VStack {
                                        Text("\(viewModel.fat)g")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                            .bold()
                                        Text("/ 128g")
                                            .font(.caption2)
                                            .foregroundColor(.gray)
                                    }
                                }
                                Text("Fat")
                                    .font(.subheadline)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }

                    //walking, activity
                    VStack {
                        HStack {
                            Rectangle()
                                       .frame(width: 80, height: 1)
                                       .foregroundColor(.gray.opacity(0.5))
                               
                               Text("Burned")
                                   .font(.caption)
                                   .foregroundColor(.gray.opacity(0.8))
                                   .bold()
                               
                            Rectangle()
                                       .frame(width: 80, height: 1)
                                       .foregroundColor(.gray.opacity(0.5))
                           }
              
                        HStack {
                            Spacer()
                            VStack{
                                VStack {
                                    Image(systemName: "figure.walk")
                                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/.opacity(0.5))
                                        .font(.title2)
                                    
                                    Text("Walking")
                                        .font(.subheadline)
                                    Text("\(viewModel.walkingCalories)")
                                        .font(.title3)
                                        .bold()
                                    Text("kcal")
                                        .font(.caption2)
                                }
                            }
                            Spacer()
                            VStack {
                                VStack {
                                    Image(systemName: "figure.run")
                                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/.opacity(0.5))
                                        .font(.title2)
                                    Text("Activity")
                                        .font(.subheadline)
                                    Text("\(viewModel.activityCalories)")
                                        .font(.title3)
                                        .bold()
                                    
                                    Text("kcal")
                                        .font(.caption2)
                                }
                            }
                            Spacer()
                        }
                    }
                   
                    
                    VStack {
                        HStack {
                            Rectangle()
                                       .frame(width: 80, height: 1)
                                       .foregroundColor(.gray.opacity(0.5))
                               
                               Text("Nutrition")
                                   .font(.caption)
                                   .foregroundColor(.gray.opacity(0.8))
                                   .bold()
                               
                            Rectangle()
                                       .frame(width: 80, height: 1)
                                       .foregroundColor(.gray.opacity(0.5))
                           }
              
                        TabView {
                            MealCard(mealName: "Breakfast", calories: "350 calories", color: .green.opacity(0.1), nutritionalData: ["Proteins": 62.5, "Fats": 23.6, "Carbs": 45.7, "RDC": 14.0]) {
                      
                            }.padding(20)
                             
                            
                            MealCard(mealName: "Lunch", calories: "500 calories", color: .green.opacity(0.1), nutritionalData: ["Proteins": 45.0, "Fats": 30.0, "Carbs": 60.0, "RDC": 22.0]) {
                               
                            }.padding(20)
                            
                            MealCard(mealName: "Dinner", calories: "600 calories", color: .green.opacity(0.1), nutritionalData: ["Proteins": 50.0, "Fats": 35.0, "Carbs": 70.0, "RDC": 25.0]) {
                                
                            }.padding(20)
                            
                            MealCard(mealName: "Snacks", calories: "200 calories", color: .green.opacity(0.1), nutritionalData: ["Proteins": 10.0, "Fats": 15.0, "Carbs": 20.0, "RDC": 8.0]) {
                        
                            }.padding(20)
                        }
                        .padding(.bottom)
                        .frame(height: 220)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        
                        
                        
                        MealCard(mealName: "Breakfast", calories: "350 calories", color: .green.opacity(0.1), nutritionalData: ["Proteins": 62.5, "Fats": 23.6, "Carbs": 45.7, "RDC": 14.0]) {
                  
                        }.padding(20)
                        
                    }
//                    LazyVGrid(columns: columns, spacing: 10) {
//                        MealCard(mealName: "Breakfast", calories: "350 calories",
//                                     color: .cyan.opacity(0.7),
//                                     nutritionalData: ["Pro": 62.5, "Fats": 23.6, "Carbs": 45.7]) {
//                                // action
//                            }
//
//                        MealCard(mealName: "Lunch", calories: "500 calories",
//                                 color: .cyan.opacity(0.7),
//                                 nutritionalData: ["Proteins": 45.0, "Fats": 30.0, "Carbs": 60.0]) {
//                            // action
//                        }
//
//                        MealCard(mealName: "Dinner", calories: "600 calories",
//                                 color: .cyan.opacity(0.7),
//                                 nutritionalData: ["Proteins": 50.0, "Fats": 35.0, "Carbs": 70.0]) {
//                            // action
//                        }
//
//                        MealCard(mealName: "Snacks", calories: "200 calories",
//                                 color:.cyan.opacity(0.7),
//                                 nutritionalData: ["Proteins": 10.0, "Fats": 15.0, "Carbs": 20.0]) {
//                            // action
//                        }
//                    }
//                    .padding(.horizontal, 10)

                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}
// Preview
#Preview {
    HomeView()
}


//ÖRNEEK   
//
//var body: some View {
//ZStack {
//    Color.white // Arka plan rengi
//    
//    VStack {
//        // Üst kısım
//        HStack {
//            Text("9:41")
//                .font(.title)
//            Spacer()
//            Image(systemName: "bell.fill")
//        }
//        .padding()
//        
//        Text("Nutrio")
//            .font(.largeTitle)
//            .fontWeight(.bold)
//        
//        HStack {
//            Text("Today, Dec 22")
//                .font(.subheadline)
//            Spacer()
//            Image(systemName: "calendar")
//        }
//        .padding()
//        
//        // Kalori bilgileri
//        HStack {
//            VStack {
//                Text("Eaten")
//                    .font(.headline)
//                Text("3010 kcal")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//            }
//            
//            VStack {
//                Text("Burned")
//                    .font(.headline)
//                Text("265 kcal")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//            }
//            
//            VStack {
//                Text("kcal left")
//                    .font(.headline)
//                Text("0")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//            }
//        }
//        .padding()
//        
//        // Makrolar
//        HStack {
//            // Karbonhidrat
//            VStack {
//                Text("Carbs")
//                    .font(.headline)
//                Text("371 / 224 g")
//                    .font(.subheadline)
//            }
//            .frame(maxWidth: .infinity)
//            
//            // Protein
//            VStack {
//                Text("Protein")
//                    .font(.headline)
//                Text("199 / 128 g")
//                    .font(.subheadline)
//            }
//            .frame(maxWidth: .infinity)
//            
//            // Yağ
//            VStack {
//                Text("Fat")
//                    .font(.headline)
//                Text("331 / 128 g")
//                    .font(.subheadline)
//            }
//            .frame(maxWidth: .infinity)
//        }
//        .padding()
//        
//        // Yakılan kalori
//        HStack {
//            VStack {
//                Image(systemName: "figure.walk")
//                Text("Walking")
//                    .font(.subheadline)
//                Text("100 kcal")
//                    .font(.subheadline)
//            }
//            .frame(maxWidth: .infinity)
//            
//            VStack {
//                Image(systemName: "flame")
//                Text("Activity")
//                    .font(.subheadline)
//                Text("165 kcal")
//                    .font(.subheadline)
//            }
//            .frame(maxWidth: .infinity)
//        }
//        .padding()
//        
//        // Kahvaltı ve Öğle Yemeği
//        VStack {
//            // Kahvaltı
//            HStack {
//                Image(systemName: "sandwich")
//                Text("Breakfast")
//                    .font(.headline)
//                Spacer()
//                Text("824 / 768 kcal")
//                    .font(.subheadline)
//            }
//            .padding()
//            
//            // Öğle Yemeği
//            HStack {
//                Image(systemName: "bowl")
//                Text("Lunch")
//                    .font(.headline)
//                Spacer()
//                Text("810 / 768 kcal")
//                    .font(.subheadline)
//            }
//            .padding()
//        }
//        .background(Color.orange)
//        .cornerRadius(10)
//        .padding()
//    
//    }
//}
//}
//}
//
