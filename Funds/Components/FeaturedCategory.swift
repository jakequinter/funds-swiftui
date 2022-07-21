//
//  FeaturedCategory.swift
//  Funds
//
//  Created by Jake Quinter on 7/11/22.
//

import SwiftUI

struct FeaturedCategory: View {
    var category: CategoryViewModel
    var expenses: [ExpenseViewModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
                Text(category.name)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.blue)
                
                Spacer()
                
            HStack(alignment: .center) {
                Text("$\(sumExpensesByCategory(categoryName: category.name), specifier: "%.2f")")
                        .font(.title3.weight(.medium))
                    
                    Text("/ $\(category.target, specifier: "%.2f")")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text("35.21%")
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(.green.opacity(0.2))
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .foregroundColor(.green)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 150)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding(.horizontal, 20)
    }
    
    func sumExpensesByCategory(categoryName: String) -> CGFloat {
        let expenses = expenses.filter { $0.type == categoryName.lowercased()}
        let expensesTotal = expenses.reduce(0) { $0 + $1.spend }
        
        return expensesTotal
        
    }
}

//struct FeaturedCategory_Previews: PreviewProvider {
//    static var previews: some View {
//        FeaturedCategory()
//    }
//}
