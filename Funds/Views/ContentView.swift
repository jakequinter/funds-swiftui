//
//  ContentView.swift
//  Funds
//
//  Created by Jake Quinter on 7/8/22.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var monthsViewModel: MonthsViewModel
    
    @State private var selectedTab = "home"
    
    var body: some View {
        if Auth.auth().currentUser ==  nil {
            LoginView()
        } else {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .onTapGesture {
                        selectedTab = "home"
                    }
                    .tag("home")
                
                CategoriesView()
                    .tabItem {
                        Label("Categories", systemImage: "rectangle.stack")
                    }
                    .onTapGesture {
                        selectedTab = "categories"
                    }
                    .tag("categories")
                
                CategoriesView()
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
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
