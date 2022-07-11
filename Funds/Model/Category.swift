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
}

var categories = [
    Category(name: "Groceries"),
    Category(name: "Restaurants"),
    Category(name: "Miscellaneous"),
    Category(name: "Recurring")
]

