//
//  MonthsViewModel.swift
//  Funds
//
//  Created by Jake Quinter on 7/14/22.
//

import Foundation
import Firebase

class MonthsViewModel: ObservableObject {
    private var firestoreManager: FirestoreManager
    @Published var month: MonthViewModel = MonthViewModel(monthModel: Month(month: 0, year: 0))
    @Published var categories: [CategoryViewModel] = []
    @Published var expenses: [ExpenseViewModel] = []
    
    init() {
        firestoreManager = FirestoreManager()
    }
    
    func fetchCurrentMonth() {
        firestoreManager.fetchMonth { result in
            switch result {
            case .success(let months):
                if let months = months {
                    DispatchQueue.main.async {
                        let allMonths = months.map(MonthViewModel.init)
                        if allMonths.count > 0 {
                            self.month = allMonths[0]
                            self.fetchCurrentMonthCategories(monthId: allMonths[0].id)
                        }
                    }
                }
            case .failure(let error):
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchCurrentMonthCategories(monthId: String) {
        firestoreManager.fetchMonthCategories(monthId: monthId) { result in
            switch result {
            case .success(let categories):
                if let categories = categories {
                    DispatchQueue.main.async {
                        self.categories = categories.map(CategoryViewModel.init)
                        
                        if self.categories.count > 0 {
                            self.fetchCurrentMonthCategoryExpenses(categoryIds: self.categories.map {
                                $0.id
                            })
                        }
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchCurrentMonthCategoryExpenses(categoryIds: [String]) {
        firestoreManager.fetchCategoryExpenses(categoryIds: categoryIds) { result in
            switch result {
            case .success(let expenses):
                if let expenses = expenses {
                    DispatchQueue.main.async {
                        self.expenses = expenses.map(ExpenseViewModel.init)
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct MonthViewModel: Identifiable {
    let monthModel: Month
    
    var id: String {
        monthModel.id ?? ""
    }
    
    var month: Int {
        monthModel.month
    }
    
    var year: Int {
        monthModel.year
    }
    
    var categories: [String] {
        monthModel.categories ?? []
    }
}

struct CategoryViewModel: Identifiable {
    let category: Category
    
    var id: String {
        category.id ?? ""
    }
    
    var name: String {
        category.name
    }
    
    var target: CGFloat {
        category.target
    }
}

struct ExpenseViewModel: Identifiable {
    let expense: Expense
    
    var id: String {
        expense.id ?? ""
    }
    
    var name: String {
        expense.name
    }
    
    var spend: CGFloat {
        expense.spend
    }
    
    var type: String {
        expense.type
    }
}
