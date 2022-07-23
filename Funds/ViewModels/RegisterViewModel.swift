//
//  RegisterViewModel.swift
//  Funds
//
//  Created by Jake Quinter on 7/23/22.
//

import Foundation
import Firebase

class RegisterViewModel: ObservableObject {
    var email = ""
    var password = ""
    
    func createAccount(completion: @escaping () -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                completion()
            }
        }
    }
}
