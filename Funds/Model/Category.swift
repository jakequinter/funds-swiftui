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


