//
//  TabBarView.swift
//  GroceriesApp
//
//  Created by Josileudo on 1/2/24.
//

import SwiftUI

struct GroceriesTabBarView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ListView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear{ selectedTab = 0 }
                .tag(0)
            
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
        }
        .tint(.button)
    }
}

struct GroceriesTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        GroceriesTabBarView()              
    }
}
