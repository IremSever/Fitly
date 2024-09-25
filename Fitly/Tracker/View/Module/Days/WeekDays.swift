//
//  WeekDays.swift
//  Fitly
//
//  Created by İrem Sever on 20.09.2024.
//

import SwiftUI

struct WeekDays: View {
    let calendar = Calendar.current
    let dateFormatter: DateFormatter
    
    @State var currentDate: Date = Date()
    @State var selectedDate: Date = Date()
    

    func getWeekDays() -> [Date] {
        let today = calendar.startOfDay(for: currentDate)
        let weekDay = calendar.component(.weekday, from: today)
        let daysBefore = weekDay - calendar.firstWeekday
        var week: [Date] = []
        
        for offset in (-daysBefore..<7 - daysBefore) {
            if let day = calendar.date(byAdding: .day, value: offset, to: today) {
                week.append(day)
            }
        }
        return week
    }
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Week Days")
                    .font(.subheadline)
                    .padding(.horizontal)
                
                Spacer()
                Image("calendar")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(8)
                    .background(Color.fitlyWhite)
                    .clipShape(Circle())
                    .padding(.horizontal)
                
            }
            HStack {
                ForEach(getWeekDays(), id: \.self) { date in
                    ZStack {
                        if calendar.isDate(selectedDate, inSameDayAs: date) {
                            Circle()
                                .frame(width: 38, height: 38)
                                .foregroundColor(.fitlyRed)
                                .offset(y: 39)
                        }

                        VStack {
                       
                            Circle()
                                .frame(width: 5, height: 5)
                                .foregroundColor(.black)
                                .opacity(isToday(date: date) ? 1.0 : 0.5)
                                .offset(y: 20)
                                .bold()

                     
                            ZStack {
                                Capsule()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 45, height: 110)

                                Text(dateFormatter.string(from: date))
                                    .foregroundColor(isToday(date: date) ? .black : .gray)
                                    .offset(y: 33)
                                    .bold()
                            }
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedDate = date
                        }
                      
                    }
                    .opacity(isToday(date: date) ? 0.5 : 0.5)
                }
            }
        }
    }
    
    func getDayOfWeek(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return String(dateFormatter.string(from: date).prefix(1))
    }
    
    func isToday(date: Date) -> Bool {
        return calendar.isDateInToday(date)
    }
}

#Preview {
    WeekDays()
}
