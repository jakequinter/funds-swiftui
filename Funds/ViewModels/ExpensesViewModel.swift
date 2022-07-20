//
//  ExpensesViewModel.swift
//  Funds
//
//  Created by Jake Quinter on 7/20/22.
//

import Foundation
import Firebase

class ExpensesViewModel: ObservableObject {
    @Published var expenses = [Expense]()
    
    private var db = Firestore.firestore()
    
    func fetchExpenses(categoryIds: [String]) {
        let expenses = self.db.collection("expenses") //self.db points to *my* firestore
        expenses.whereField("categoryId", in: categoryIds)
            .getDocuments(completion: { querySnapshot, error in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            guard let documents = querySnapshot?.documents else { return }
            
            self.expenses = documents.map { (queryDocumentSnapshot) -> Expense in
                let data = queryDocumentSnapshot.data()

                let name = data["name"] as? String ?? ""
                let spend = data["spend"] as? CGFloat ?? 0

                return Expense(name: name, spend: spend)
            }
        })
    }
}
