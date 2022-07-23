//
//  SplashScreen.swift
//  Funds
//
//  Created by Jake Quinter on 7/21/22.
//

import SwiftUI

struct SplashScreen: View {
    @ObservedObject var monthsViewModel = MonthsViewModel()
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive && monthsViewModel.month.month == 0 && monthsViewModel.month.year == 0 {
            AddMonthView(monthsViewModel: monthsViewModel, hasCurrentMonth: $monthsViewModel.hasCurrentMonth)
        } else if isActive && monthsViewModel.month.month != 0 && monthsViewModel.month.year != 0 {
            ContentView(monthsViewModel: monthsViewModel)
        } else {
            
            ZStack {
                Color("Emerald").opacity(0.3)
                    .ignoresSafeArea()
                VStack {
                    Image(systemName: "dollarsign.square.fill")
                        .font(.system(size: 80))
                        .foregroundColor(Color("Emerald"))
                    
                    Text("funds")
                        .font(.system(size: 24).bold())
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    monthsViewModel.fetchCurrentMonth()
                    
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
