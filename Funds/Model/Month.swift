//
//  Month.swift
//  Funds
//
//  Created by Jake Quinter on 7/13/22.
//

import SwiftUI

struct Month: Identifiable {
    let id = UUID().uuidString
    var month: Int
    var year: Int
    var categories: [Category]
}
