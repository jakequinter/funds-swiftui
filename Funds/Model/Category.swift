//
//  Category.swift
//  Funds
//
//  Created by Jake Quinter on 7/11/22.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    var name: String
    var currentSpend: CGFloat
    var targetAmount: CGFloat
}

var categories = [
    Category(name: "Groceries", currentSpend: 221.56, targetAmount: 600),
    Category(name: "Restaurants", currentSpend: 112.13, targetAmount: 400),
    Category(name: "Miscellaneous", currentSpend: 875.12, targetAmount: 1300),
    Category(name: "Recuring", currentSpend: 614, targetAmount: 614),
]

