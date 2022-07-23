//
//  CategoriesView.swift
//  Funds
//
//  Created by Jake Quinter on 7/21/22.
//

import SwiftUI

struct CategoriesView: View {
    var categories: [CategoryViewModel]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories) { category in
                    Text(category.name)
                }
            }
            .navigationTitle("Categories")
        }
    }
}

//struct CategoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoriesView()
//    }
//}
