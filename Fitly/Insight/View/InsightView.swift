//
//  InsightView.swift
//  Fitly
//
//  Created by İrem Sever on 8.09.2024.
//
import SwiftUI


struct InsightView: View {
    @State private var selectedDateRange: String = "Aug 16 - Aug 22, 2024"
    @State private var selectedDayIndex: Int = 2 // Varsayılan olarak bir gün seçili olacak (örnek: Salı)
    
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    let calorieIntake = [2500, 2300, 2200, 2100, 2000, 1900, 1800]
    let calorieGoal: CGFloat = 2200
    
    let nutritionData = [
        (carbs: 50, protein: 30, fat: 20),
        (carbs: 45, protein: 35, fat: 20),
        (carbs: 55, protein: 25, fat: 20),
        (carbs: 50, protein: 30, fat: 20),
        (carbs: 60, protein: 25, fat: 15),
        (carbs: 40, protein: 30, fat: 30),
        (carbs: 55, protein: 30, fat: 15)
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                
                // date
                HStack {
                    
                    HStack {
                        Spacer()
                        Button(action: { /* action here */ }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text(selectedDateRange)
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
                }
                .padding(.horizontal)
                
                //weekly, monthly, yearly
                HStack {
                    Button(action: { /* action */ }) {
                        Text("Weekly")
                            .foregroundColor(.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 30)
                            .background(Color.orange)
                            .cornerRadius(20)
                    }
                    Button(action: { /* action */ }) {
                        Text("Monthly")
                            .foregroundColor(.gray)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 30)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                    }
                    Button(action: { /* action */ }) {
                        Text("Yearly")
                            .foregroundColor(.gray)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 30)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                    }
                }
                .padding(.top, 10)
              
              
                // calorie section
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Calorie (kcal)")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    HStack {
                        Spacer()
                        // calorie intake list on the left
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(0..<7, id: \.self) { day in
                                Text("\(calorieIntake[day])")
                                    .font(.caption)
                                    .foregroundColor(selectedDayIndex == day ? .orange : .gray)
                                    .onTapGesture {
                                        selectedDayIndex = day
                                    }
                            }
                        }
                        
                        // graph with days at the bottom
                        ZStack {
                            HStack(alignment: .bottom, spacing: 12) {
                                ForEach(0..<7, id: \.self) { day in
                                    VStack {
                                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                                            .fill(selectedDayIndex == day ? Color.green : Color.green.opacity(0.3))
                                            .frame(width: 24, height: CGFloat((Double(calorieIntake[day]) / 2000.0) * 150))
                                            .onTapGesture {
                                                selectedDayIndex = day
                                            }
                                        
                                        Text(days[day])
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                            }
                            Rectangle()
                                .fill(Color.gray.opacity(0.5))
                                .frame(height: 2)
                                .offset(y: -CGFloat((calorieGoal / 9000) * 150))
                                .padding(.horizontal)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // nutrition
                VStack(alignment: .leading, spacing: 10) {
                    Text("Nutrition (%)")
                        .font(.headline)
                    
                    HStack(alignment: .bottom, spacing: 12) {
                        ForEach(0..<7, id: \.self) { day in
                            VStack {
                                ZStack(alignment: .bottom) {
                                    // Fat
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.blue)
                                        .frame(width: 24, height: CGFloat(nutritionData[day].fat))
                                    
                                    // rotein
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.orange)
                                        .frame(width: 24, height: CGFloat(nutritionData[day].protein))
                                    
                                    // Carbs
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.red)
                                        .frame(width: 24, height: CGFloat(nutritionData[day].carbs))
                                }
                                Text(days[day])
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .frame(height: 100)
                    .padding(.horizontal)
                }
                
                Spacer()
            }
//            .navigationBarTitle("Insights", displayMode: .inline)
        }
    }
}

// Nutrition bar view component
struct NutritionBar: View {
    let percentage: CGFloat
    let color: Color
    let label: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(color.opacity(0.2))
                    .frame(width: 30, height: 100)
                RoundedRectangle(cornerRadius: 5)
                    .fill(color)
                    .frame(width: 30, height: percentage)
            }
            Text(label)
                .font(.caption)
        }
    }
}

#Preview {
    InsightView()
}

#Preview {
    InsightView()
}
