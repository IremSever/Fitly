import SwiftUI

struct FitlyTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack {
            VStack {
                
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    TrackerView()
                case 2:
                    RecipeView()
                default:
                    AccountView()
                }
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                // Tab bar
                HStack {
                    Spacer()
                    
                    Button(action: {
                        selectedTab = 0
                    }) {
                        Image(systemName: "house")
                            .foregroundColor(selectedTab == 0 ? Color.black : Color.gray)
                            .padding(15)
                            .background(selectedTab == 0 ? Color.fitlyYellow : Color.white)
                            .clipShape(Circle())
                        
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        selectedTab = 1
                    }) {
                        Image(systemName: "calendar")
                            .foregroundColor(selectedTab == 1 ? Color.black : Color.gray)
                            .padding(15)
                            .background(selectedTab == 1 ? Color.fitlyYellow : Color.white)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    // Recipe Tab
                    Button(action: {
                        selectedTab = 2
                    }) {
                        Image(systemName: "book")
                            .foregroundColor(selectedTab == 2 ? Color.black : Color.gray)
                            .padding(15)
                            .background(selectedTab == 2 ? Color.fitlyYellow : Color.white)
                            .clipShape(Circle())
                        
                    }
                    
                    Spacer()
                    
                    // Account Tab
                    Button(action: {
                        selectedTab = 3
                    }) {
                        Image(systemName: "person")
                            .foregroundColor(selectedTab == 3 ? Color.black : Color.gray)
                            .padding(15)
                            .background(selectedTab == 3 ? Color.fitlyYellow : Color.white)
                            .clipShape(Circle())
                        
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Capsule().fill(Color.fitlyWhite.opacity(1)))
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .shadow(radius: 5)
            }
        }
    }
}

#Preview {
    FitlyTabView()
}
