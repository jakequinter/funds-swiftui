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
    
    /*
        Months
     */
    func fetchMonth(userId: String, completion: @escaping (Result<[Month]?, Error>) -> Void) {
        let currentMonth = Calendar.current.component(.month, from: Date())
        let currentYear = Calendar.current.component(.year, from: Date())
        
        db.collection("months")
            .whereField("userId", isEqualTo: userId)
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
    
    func addMonth(month: Month, completion: @escaping (Result<Month?, Error>) -> Void) {
        do {
            let ref = try db.collection("months").addDocument(from: month)
            
            ref.getDocument { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    completion(.failure(error!))
                    return
                }
                
                let month = try? snapshot.data(as: Month.self)
                completion(.success(month))
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    /*
        Categories
     */
    func fetchMonthCategories(monthId: String, completion: @escaping (Result<[Category]?, Error>) -> Void) {
        db.collection("categories")
            .whereField("monthId", isEqualTo: monthId)
            .order(by: "name")
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
    
    /*
        Expenses
     */
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
    
    func addExpense(expense: Expense, completion: @escaping (Result<Expense?, Error>) -> Void) {
        do {
            let ref = try db.collection("expenses").addDocument(from: expense)
            
            ref.getDocument { (snapshot, error) in
                guard let snapshot = snapshot, error == nil else {
                    completion(.failure(error!))
                    return
                }
                
                let expense = try? snapshot.data(as: Expense.self)
                completion(.success(expense))
            }
        } catch {
            completion(.failure(error))
        }
    }
}
