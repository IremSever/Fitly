//
//  AccountView.swift
//  Fitly
//
//  Created by İrem Sever on 8.09.2024.
//

import SwiftUI
struct User {
    let name: String
    let email: String
}

struct AccountView: View {
    let user = User(name: "İrem Sever Sadık", email: "iremsever@outlook.com")

    var body: some View {
        NavigationView {
            
            
                   List {
                       
                       Section() {
                           HStack {
                               Image(systemName: "crown")
                                   .foregroundColor(.yellow)
                               Text("Upgrade Plan Now!")
                                   .font(.headline)
                           }
                           NavigationLink(destination: AccountView()) {
                               HStack {
                                   Image(systemName: "person.circle")
                                   VStack {
                                       Text(user.name)
                                       Text(user.email)
                                           .font(.caption)
                                   }
                               }
                           }
                       }

                Section() {
                    NavigationLink(destination: Text("Calorie Counter")) {
                        Label("Calorie Counter", systemImage: "thermometer")
                    }
                    NavigationLink(destination: Text("Water Tracker")) {
                        Label("Water Tracker", systemImage: "drop.fill")
                    }
                    NavigationLink(destination: Text("Step Counter")) {
                        Label("Step Counter", systemImage: "")
                    }
                    NavigationLink(destination: Text("Weight Tracker")) {
                        Label("Weight Tracker", systemImage: "")
                    }
                    NavigationLink(destination: Text("Preferences")) {
                        Label("Preferences", systemImage: "gear")
                    }
                }

                Section() {
                    NavigationLink(destination: Text("Notifications")) {
                        Label("Notifications", systemImage: "bell")
                    }
                    NavigationLink(destination: Text("Payment Methods")) {
                        Label("Payment Methods", systemImage: "creditcard")
                    }
                    NavigationLink(destination: Text("Billing & Subscriptions")) {
                        Label("Billing & Subscriptions", systemImage: "dollarsign.circle")
                    }
                    NavigationLink(destination: Text("Help & Support")) {
                        Label("Help & Support", systemImage: "info")
                    }
                
                }
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}
