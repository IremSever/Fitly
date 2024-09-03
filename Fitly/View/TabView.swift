//
//  TabView.swift
//  Fitly
//
//  Created by IREM SEVER on 3.09.2024.
//

import SwiftUI

struct TabView: View {
    @State var selectedTap = "Home"
    
    var body: some View {
        TabView(selection: $selectedTap) {
            HomeView()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                }
        }
    }
}

#Preview {
    TabView()
}
