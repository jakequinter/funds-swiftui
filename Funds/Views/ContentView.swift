//
//  ContentView.swift
//  Funds
//
//  Created by Jake Quinter on 7/8/22.
//

import SwiftUI

struct ContentView: View {
    var monthsViewModel: MonthsViewModel
    @State private var selectedTab = "home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(monthsViewModel: monthsViewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .onTapGesture {
                    selectedTab = "home"
                }
                .tag("home")
            
            CategoriesView(monthsViewModel: monthsViewModel)
                .tabItem {
                    Label("Categories", systemImage: "rectangle.stack")
                }
                .onTapGesture {
                    selectedTab = "categories"
                }
                .tag("categories")
            
            CategoriesView(monthsViewModel: monthsViewModel)
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
