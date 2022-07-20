//
//  ContentView.swift
//  Funds
//
//  Created by Jake Quinter on 7/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .onTapGesture {
                    selectedTab = "home"
                }
                .tag("home")
            
            HomeView()
                .tabItem {
                    Label("Categories", systemImage: "rectangle.stack")
                }
                .onTapGesture {
                    selectedTab = "categories"
                }
                .tag("categories")
            
            HomeView()
                .tabItem {
                    Label("History", systemImage: "calendar")
                }
                .onTapGesture {
                    selectedTab = "history"
                }
                .tag("history")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
