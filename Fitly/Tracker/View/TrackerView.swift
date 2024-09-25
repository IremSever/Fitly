//
//  TrackerView.swift
//  Fitly
//
//  Created by İrem Sever on 8.09.2024.
//
import SwiftUI
struct TrackerView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State private var waterIntake: Int = 0
    @State private var waterGoal: Int = 2500
    
//    @State private var stepCount: Int = 5045
//    @State private var stepGoal: Int = 6000

//    @State private var bmi: Double = 24.9
//    @State private var bmiStatus: String = "Normal"

    var body: some View {
        NavigationView {
            VStack {
                
                //week days
                WeekDays()
                    .padding(.vertical)
                Calorie()
                    .padding(.vertical)
                
            
                
                HStack{
                    Nutrition(value: 1790, total: 2500, label: "Cal", displayValue: "1230")
                    Nutrition(value: 61.4, total: 100, label: "Prot", displayValue: "61.4")
                    Nutrition(value: 55, total: 100, label: "Carb", displayValue: "50.0")
                    Nutrition(value: 43.8, total: 100, label: "Fats", displayValue: "43.8")
                    Nutrition(value: 32, total: 100, label: "RDC", displayValue: "32%")
                }
                .padding(.vertical)
                
                HStack{
                    Spacer()
                    WaterStatistic()
                    Spacer()
                    
                    CalorieChart(currentCalories: viewModel.caloriesEaten, totalCalories: viewModel.caloriesGoal)
                    Spacer()
                }
                .padding(.vertical)
    
              
//                //weight
//                HStack {
//                    VStack(alignment: .leading) {
//                        HStack {
//                            
//                            VStack(alignment: .leading) {
//                                Text("Weight")
//                                    .font(.subheadline)
//                                    .bold()
//                                HStack {
//                                    Text(String(format: "%.1f", currentWeight) + " kg")
//                                        .font(.title2)
//                                        .bold()
//                                    
//                                    HStack {
//                                        Image(systemName: "checkmark.circle.fill")
//                                            .foregroundColor(.green)
//                                            .font(.caption)
//                                        Text(String(format: "%.1f", weightChange) + " kg")
//                                            .font(.caption)
//                                            .foregroundColor(.green)
//                                    }
//                                    Spacer()
//                                    
//                                }
//                            }
//                            Button(action: {
//                                // action
//                            }) {
//                                Text("Upgrade")
//                                    .bold()
//                                    .font(.caption2)
//                                    .foregroundColor(.orange)
//                                    .padding()
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 40)
//                                            .stroke(Color.orange, lineWidth: 2)
//                                    )
//                            }
//                        }
//                        
//                        WeightProgressBar(weightProgress: (startingWeight - currentWeight) / (startingWeight - goalWeight))
//                            .frame(height: 10)
//                            .padding(.vertical, 8)
//                        
//                        HStack {
//                            Text("Starting: \(String(format: "%.1f", startingWeight)) kg")
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                            Spacer()
//                            Text("Goal: \(String(format: "%.1f", goalWeight)) kg")
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//                .padding()
//                .background(Color(.white))
//                .cornerRadius(10)
//                .shadow(radius: 3)
                
//                //BMI
//                VStack {
//                    HStack{
//                        VStack(alignment: .leading) {
//                            Text("BMI (kg/m2)")
//                                .font(.subheadline)
//                                .bold()
//                            
//                            HStack{
//                                Text(String(format: "%.1f", bmi))
//                                    .font(.title2)
//                                    .bold()
//                                
//                                Text(bmiStatus)
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
//                                
//                                Spacer()
//                                
//                                
//                            }
//                        }
//                        Button(action: {
//                            // action
//                        }) {
//                            Image(systemName: "pencil.circle")
//                                .foregroundColor(.orange)
//                                .font(.title)
//                        }
//                        
//                    }
//                    .padding(.horizontal)
//                    BMIProgressBar(bmi: bmi)
//                        .padding(.horizontal)
//                    
//                    
//                }
//                .padding()
//                .background(Color(.white))
//                .cornerRadius(10)
//                .shadow(radius: 3)
                
            }
            .padding()
        }
    }
}

#Preview {
    TrackerView()
}
