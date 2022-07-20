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
    
    func fetchCategories(monthId: String) {
        let categories = self.db.collection("categories") //self.db points to *my* firestore
        categories.whereField("monthId", isEqualTo: monthId)
            .order(by: "name")
            .getDocuments(completion: { querySnapshot, error in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            guard let documents = querySnapshot?.documents else { return }
            
            self.categories = documents.map { (queryDocumentSnapshot) -> Category in
                let data = queryDocumentSnapshot.data()

                let name = data["name"] as? String ?? ""
                let target = data["target"] as? CGFloat ?? 0

                return Category(name: name, target: target)
            }
        })
    }
}
