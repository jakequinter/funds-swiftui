//
//  FirestoreManager.swift
//  Funds
//
//  Created by Jake Quinter on 7/21/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FirestoreManager {
    private var db: Firestore
    
    init() {
        db = Firestore.firestore()
    }
    
    func fetchMonth(completion: @escaping (Result<[Month]?, Error>) -> Void) {
        let currentMonth = Calendar.current.component(.month, from: Date())
        let currentYear = Calendar.current.component(.year, from: Date())
        
        db.collection("months")
            .whereField("month", isEqualTo: currentMonth)
            .whereField("year", isEqualTo: currentYear)
            .getDocuments { snapshot, error in
                if let error = error {
                    completion(.failure(error))
                    return
                } else {
                    if let snapshot = snapshot {
                        let months: [Month]? = snapshot.documents.compactMap { doc in
                            var month = try? doc.data(as: Month.self) // desirializing document as a Month
                            if month != nil {
                                month!.id = doc.documentID
                            }
                            
                            return month
                        }
                        
                        completion(.success(months))
                    }
                }
            }
    }
    
    func fetchMonthCategories(monthId: String, completion: @escaping (Result<[Category]?, Error>) -> Void) {
        db.collection("categories")
            .whereField("monthId", isEqualTo: monthId)
            .getDocuments { snapshot, error in
                if let error = error {
                    completion(.failure(error))
                    return
                } else {
                    if let snapshot = snapshot {
                        let categories = snapshot.documents.compactMap { doc in
                            var category = try? doc.data(as: Category.self)
                            category?.id = doc.documentID
                            
                            return category
                        }
                        
                        completion(.success(categories))
                    }
                }
            }
    }
    
    func fetchCategoryExpenses(categoryIds: [String], completion: @escaping (Result<[Expense]?, Error>) -> Void) {
        db.collection("expenses")
            .whereField("categoryId", in: categoryIds)
            .getDocuments { snapshot, error in
                if let error = error {
                    completion(.failure(error))
                    return
                } else {
                    if let snapshot = snapshot {
                        let expenses = snapshot.documents.compactMap { doc in
                            var expense = try? doc.data(as: Expense.self)
                            expense?.id = doc.documentID
                            
                            return expense
                        }
                        
                        completion(.success(expenses))
                    }
                }
            }
    }
}
