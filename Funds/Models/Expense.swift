//
//  Expense.swift
//  Funds
//
//  Created by Jake Quinter on 7/20/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Expense: Codable, Identifiable {
    @DocumentID var id: String?
    var categoryId: String
    var name: String
    var spend: CGFloat
    var type: String
}
