//
//  HomeView.swift
//  Fitly
//
//  Created by IREM SEVER on 3.09.2024.
//
import SwiftUI

struct HomeView: View {
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
    var mockActivites = [
        Activity(id: 0, title: "Today Steps", subTitle: "Goal 10000", image: "figure.walk", tintColor: .orange, amount: "6236"),
        Activity(id: 1, title: "Today Steps", subTitle: "Goal 1000", image: "figure.walk", tintColor: .purple, amount: "812"),
        Activity(id: 2, title: "Today Steps", subTitle: "Goal 10000", image: "figure.walk", tintColor: .yellow, amount: "9281"),
        Activity(id: 3, title: "Today Steps", subTitle: "Goal 50000", image: "figure.run", tintColor: .blue, amount: "100324"),
    
    
    ]
    
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                            Button(action: {
                              
                            }) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 18))
                                    .foregroundColor(.gray)
                            }
                            
                            Text("Today, Dec 22")
                                .font(.title3)
                                .padding()
                                .foregroundColor(.black)
                            
                            Button(action: {
                                
                            }) {
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 18))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Calories")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.red)
                            Text("1020 kcal")
                                .bold()
                        }
                        .padding(.bottom)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.green)
                            Text("52 mins")
                                .bold()
                        }
                        .padding(.bottom)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Stand")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.blue)
                            Text("8 hours")
                                .bold()
                        }
                    }

                    Spacer()
                    
                    ZStack {
                        CircleProgressView(progress: $calories, goal: 600, color: .red)
                        CircleProgressView(progress: $active, goal: 60, color: .green)
                            .padding(.all, 20)
                        CircleProgressView(progress: $stand, goal: 10, color: .blue)
                            .padding(.all, 40)
                    }
                    .padding(.horizontal)
    
                    Spacer()
                }
                .padding()
            }
            
            HStack {
                
                Text("Fitness Activities")
                    .font(.title2)
                
                 Spacer()
                
                Button {
                    print("show more")
                } label: {
                    Text("show more")
                        .padding(.all, 5)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(10)
                }
                
            }
            .padding(.horizontal)
            
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2), content: {
                ForEach(mockActivites, id: \.id) { activity in
                    ActivityCard(activity: activity)
                }
            })
            .padding(.horizontal)
        }
    }
}
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
