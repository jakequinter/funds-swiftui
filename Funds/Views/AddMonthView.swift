//
//  AddMonthView.swift
//  Funds
//
//  Created by Jake Quinter on 7/22/22.
//

import SwiftUI

struct AddMonthView: View {
    @ObservedObject var monthsViewModel: MonthsViewModel
    @Binding var hasCurrentMonth: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("You currently don't have a budget started this month. Tap below to create one!")
                
                Button("Create new month") {
                    monthsViewModel.addNewMonth()
                    
                    hasCurrentMonth = true
                }
                
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), isActive: $monthsViewModel.hasCurrentMonth) {EmptyView().navigationBarBackButtonHidden()}
            }
        }
    }
}

//struct AddMonthView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddMonthView()
//    }
//}
