//
//  CategoriesView.swift
//  Funds
//
//  Created by Jake Quinter on 7/21/22.
//

import SwiftUI

struct CategoriesView: View {
    var monthsViewModel: MonthsViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(monthsViewModel.categories) { category in
                    Text(category.name)
                }
            }
            .navigationTitle("Categories")
        }
        .onAppear {
            monthsViewModel.fetchCurrentMonth()
        }
    }
}

//struct CategoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoriesView()
//    }
//}
