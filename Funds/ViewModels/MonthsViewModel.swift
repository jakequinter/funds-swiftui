//
//  MonthsViewModel.swift
//  Funds
//
//  Created by Jake Quinter on 7/14/22.
//

import Foundation
import Firebase

class MonthsViewModel: ObservableObject {
    @Published var month = Month(month: 0, year: 0)
    
    private var db = Firestore.firestore()
    
    func fetchCurrentMonth() {
        let currentMonth = Calendar.current.component(.month, from: Date())
        let currentYear = Calendar.current.component(.year, from: Date())
        
        let docRef = db.collection("months").whereField("month", isEqualTo: currentMonth).whereField("year", isEqualTo: currentYear)
        
        docRef.getDocuments { snapshot, error in
            if let err = error {
                print(err.localizedDescription)
                return
            } else {
                if let snapshot = snapshot {
                    let months: [Month]? = snapshot.documents.compactMap { doc in
                        var month = try? doc.data(as: Month.self)
                        if month != nil {
                            month!.id = doc.documentID
                        }
                        
                        return month
                    }
                    
                    if months != nil && months!.count > 0 {
                        self.month = months![0]
                    }
                }
            }
        }
    }
}
