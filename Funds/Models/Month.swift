//
//  Month.swift
//  Funds
//
//  Created by Jake Quinter on 7/13/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Month: Codable, Identifiable {
    @DocumentID var id: String?
    let month: Int
    let year: Int
}
