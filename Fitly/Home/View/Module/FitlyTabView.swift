//
//  FitlyTabView.swift
//  Fitly
//
//  Created by IREM SEVER on 3.09.2024.
//

import SwiftUI

struct FitlyTabView: View {
    @State var selectedTab = "Home"
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.stackedLayoutAppearance.selected.iconColor = .purple
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.purple]
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) { 
            HomeView()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                }
            
            TrackerView()
                .tag("TrackerView")
                .tabItem {
                    Image(systemName: "calendar")
                }
            
            InsightView()
                .tag("InsightView")
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                }
            
            RecipeView()
                .tag("RecipeView")
                .tabItem {
                    Image(systemName: "book")
                }
            
            AccountView()
                .tag("AccountView")
                .tabItem {
                    Image(systemName: "person")
                }
            
            
            
        }
    }
}

#Preview {
    FitlyTabView()
}
