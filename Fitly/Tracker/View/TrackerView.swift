//
//  TrackerView.swift
//  Fitly
//
//  Created by İrem Sever on 8.09.2024.
//
import SwiftUI
struct TrackerView: View {
    @State private var waterIntake: Int = 0
    @State private var waterGoal: Int = 2500
    
    @State private var stepCount: Int = 5045
    @State private var stepGoal: Int = 6000
    
    @State private var currentWeight: Double = 78.4
    @State private var startingWeight: Double = 80.0
    @State private var goalWeight: Double = 75.0
    @State private var weightChange: Double = -0.1
    
    @State private var bmi: Double = 24.9
    @State private var bmiStatus: String = "Normal"

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                //water
                HStack {
                    VStack(alignment: .leading) {
                        Text("Water")
                            .font(.subheadline)
                            .bold()
                        Text("\(waterIntake) mL")
                            .font(.title2)
                            .bold()
                        
                        Text(" / \(waterGoal) mL")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                         
                    }
                    .padding(.horizontal)
                 Spacer()
                    HStack {
                        Button(action: {
                            if waterIntake > 0 { waterIntake -= 100 }
                        }) {
                            Image(systemName: "minus.circle")
                                .font(.title)
                                .foregroundColor(.cyan)
                        
                        }
                        
                        WaterDropProgressView(progress: Double(waterIntake) / Double(waterGoal))
                            .padding(.bottom)
                        
                        
                        Button(action: {
                            if waterIntake < waterGoal { waterIntake += 100 }
                        }) {
                            Image(systemName: "plus.circle")
                                .font(.title)
                                .foregroundColor(.cyan)
                        }
                        
                 
                       
                    }
                    
                    
                }
                .padding()
                .background(Color(.white))
                .cornerRadius(10)
                .shadow(radius: 3)
           
                //step
                HStack {
                    VStack(alignment: .leading) {
                        Text("Step")
                            .font(.subheadline)
                            .bold()
                        Text("\(stepCount) steps")
                            .font(.title2)
                            .bold()
                        
                        Text("/ \(stepGoal) steps")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    StepProgressView(progress: Double(stepCount) / Double(stepGoal))
                        .padding(.horizontal)
                    
                }
                .padding()
                .background(Color(.white))
                .cornerRadius(10)
                .shadow(radius: 3)

                //weight
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            
                            VStack(alignment: .leading) {
                                Text("Weight")
                                    .font(.subheadline)
                                    .bold()
                                HStack {
                                    Text(String(format: "%.1f", currentWeight) + " kg")
                                        .font(.title2)
                                        .bold()
                                    
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                            .font(.caption)
                                        Text(String(format: "%.1f", weightChange) + " kg")
                                            .font(.caption)
                                            .foregroundColor(.green)
                                    }
                                    Spacer()
                                    
                                }
                            }
                            Button(action: {
                                // action
                            }) {
                                Text("Upgrade")
                                    .bold()
                                    .font(.caption2)
                                    .foregroundColor(.orange)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(Color.orange, lineWidth: 2)
                                    )
                            }
                        }
                        
                        WeightProgressBar(weightProgress: (startingWeight - currentWeight) / (startingWeight - goalWeight))
                            .frame(height: 10)
                            .padding(.vertical, 8)
                        
                        HStack {
                            Text("Starting: \(String(format: "%.1f", startingWeight)) kg")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text("Goal: \(String(format: "%.1f", goalWeight)) kg")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
                .background(Color(.white))
                .cornerRadius(10)
                .shadow(radius: 3)
                
                //BMI
                VStack {
                    HStack{
                        VStack(alignment: .leading) {
                            Text("BMI (kg/m2)")
                                .font(.subheadline)
                                .bold()
                            
                            HStack{
                                Text(String(format: "%.1f", bmi))
                                    .font(.title2)
                                    .bold()
                                
                                Text(bmiStatus)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                                
                                
                            }
                        }
                        Button(action: {
                            // action
                        }) {
                            Image(systemName: "pencil.circle")
                                .foregroundColor(.orange)
                                .font(.title)
                        }
                        
                    }
                    .padding(.horizontal)
                    BMIProgressBar(bmi: bmi)
                        .padding(.horizontal)
                    
                    
                }
                .padding()
                .background(Color(.white))
                .cornerRadius(10)
                .shadow(radius: 3)
                
            }
            .padding()
            .navigationTitle("Tracker")
        }
    }
}

#Preview {
    TrackerView()
}
