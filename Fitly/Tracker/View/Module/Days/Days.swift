//
//  Days.swift
//  Fitly
//
//  Created by İrem Sever on 20.09.2024.
//

import SwiftUI

struct WeekDaysView: View {
    // Haftalık günler ve tarihleri tutmak için bir dizi
    let calendar = Calendar.current
    let dateFormatter: DateFormatter
    
    // Şu anki tarihi alıyoruz
    @State var currentDate: Date = Date()
    
    // Haftanın günlerini ve tarihlerini hesaplayan fonksiyon
    func getWeekDays() -> [Date] {
        let today = calendar.startOfDay(for: currentDate)
        let weekDay = calendar.component(.weekday, from: today)
        let daysBefore = weekDay - calendar.firstWeekday
        var week: [Date] = []
        
        // Geçerli haftanın başından itibaren tarihleri oluştur
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
            Text("Week Days")
                .font(.title)
                .padding()
            
            HStack {
                ForEach(getWeekDays(), id: \.self) { date in
                    VStack {
                        Text(self.getDayOfWeek(for: date))
                            .font(.headline)
                        Text(self.dateFormatter.string(from: date))
                            .font(.body)
                            .padding(10)
                            .background(self.isToday(date: date) ? Color.blue : Color.gray.opacity(0.2))
                            .clipShape(Circle())
                            .foregroundColor(self.isToday(date: date) ? .white : .black)
                    }
                }
            }
        }
    }
    
    // Haftanın gün ismini almak için
    func getDayOfWeek(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return String(dateFormatter.string(from: date).prefix(1))
    }
    
    // Bugünü kontrol eden fonksiyon
    func isToday(date: Date) -> Bool {
        return calendar.isDateInToday(date)
    }
}

struct ContentView: View {
    var body: some View {
        WeekDaysView()
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
