//
//  FundsApp.swift
//  Funds
//
//  Created by Jake Quinter on 7/8/22.
//

import SwiftUI
import Firebase

@main
struct FundsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
