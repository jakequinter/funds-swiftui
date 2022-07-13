//
//  Category.swift
//  Funds
//
//  Created by Jake Quinter on 7/11/22.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID().uuidString
    var name: String
    var spend: CGFloat
    var target: CGFloat
}

//var categories = [
//    Category(name: "Groceries", spend: 221.56, target: 600),
//    Category(name: "Restaurants", spend: 112.13, target: 400),
//    Category(name: "Miscellaneous", spend: 875.12, target: 1300),
//    Category(name: "Recuring", spend: 614, target: 614),
//]

