//
//  CategoriesViewModel.swift
//  Funds
//
//  Created by Jake Quinter on 7/12/22.
//

import Foundation
import Firebase

class CategoriesViewModel: ObservableObject {
    @Published var categories = [Category]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("Categories").order(by: "createdAt", descending: false).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                
                return
            }
            
            self.categories = documents.map { (queryDocumentSnapshot) -> Category in
                let data = queryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let spend = data["spend"] as? CGFloat ?? 0
                let target = data["target"] as? CGFloat ?? 0
                
                return Category(name: name, spend: spend, target: target)
            }
        }
    }
}
