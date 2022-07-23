//
//  Category.swift
//  Funds
//
//  Created by Jake Quinter on 7/11/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Category: Codable, Identifiable {
    @DocumentID var id: String?
    var monthId: String
    var name: String
    var target: CGFloat
}


