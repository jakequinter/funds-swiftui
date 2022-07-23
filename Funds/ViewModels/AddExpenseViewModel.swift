//
//  AddExpenseViewModel.swift
//  Funds
//
//  Created by Jake Quinter on 7/22/22.
//

import Foundation
import Firebase

class AddExpenseViewModel: ObservableObject {
    private var firestoreManager: FirestoreManager
    @Published var expenseSaved: Bool = false
    
    @Published var categoryId = ""
    var name = ""
    var spend = ""
    var type = ""
    
    init() {
        firestoreManager = FirestoreManager()
    }
    
    func addNewExpense() {
        let expense = Expense(categoryId: categoryId, name: name, spend: CGFloat((spend as NSString).floatValue), type: type)
        
        firestoreManager.addExpense(expense: expense) { result in
            switch result {
                case .success(let expense):
                    DispatchQueue.main.async {
                        self.expenseSaved = expense == nil ? false : true
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
