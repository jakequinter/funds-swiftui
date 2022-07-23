//
//  MonthsViewModel.swift
//  Funds
//
//  Created by Jake Quinter on 7/14/22.
//

import Foundation
import Firebase

enum LoadingState {
    case idle
    case loading
    case success
    case failure
}

class MonthsViewModel: ObservableObject {
    private var firestoreManager: FirestoreManager
    @Published var month: MonthViewModel?
    @Published var categories: [CategoryViewModel] = []
    @Published var expenses: [ExpenseViewModel] = []
    @Published var hasCurrentMonth: Bool = false
    @Published var loadingState: LoadingState = .idle
    
    init() {
        firestoreManager = FirestoreManager()
    }
    
    func fetchCurrentMonth() {
        DispatchQueue.main.async {
            self.loadingState = .loading
        }
        
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        firestoreManager.fetchMonth(userId: currentUser.uid) { result in
            switch result {
            case .success(let months):
                if let months = months {
                    DispatchQueue.main.async {
                        let allMonths = months.map(MonthViewModel.init)
                        if allMonths.count > 0 {
                            self.month = allMonths[0]
                            self.fetchCurrentMonthCategories(monthId: allMonths[0].id)
                        } else {
                            self.month = nil
                        }
                        
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.loadingState = .failure
                }
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }
    
    func addNewMonth() {
        let currentMonth = Calendar.current.component(.month, from: Date())
        let currentYear = Calendar.current.component(.year, from: Date())
        
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        let month = Month(userId: currentUser.uid, month: currentMonth, year: currentYear)
        firestoreManager.addMonth(month: month) { result in
            switch result {
            case .success(let month):
                DispatchQueue.main.async {
                    self.hasCurrentMonth = month == nil ? false : true
                    
                    if self.hasCurrentMonth {
                        self.fetchCurrentMonth()
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
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
    
    var monthId: String {
        monthModel.userId ?? ""
    }
    
    var month: Int {
        monthModel.month
    }
    
    var year: Int {
        monthModel.year
    }
}

struct CategoryViewModel: Identifiable {
    let category: Category
    
    var id: String {
        category.id ?? ""
    }
    
    var monthId: String {
        category.monthId
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
