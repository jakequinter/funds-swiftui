//
//  Expense.swift
//  Funds
//
//  Created by Jake Quinter on 7/20/22.
//

import Foundation

struct Expense: Identifiable {
    let id = UUID().uuidString
    var name: String
    var spend: CGFloat
}
