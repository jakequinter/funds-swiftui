//
//  LoginViewModel.swift
//  Funds
//
//  Created by Jake Quinter on 7/23/22.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    var email = ""
    var password = ""
    
    func login(completion: @escaping () ->  Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                completion()
            }
        }
    }
}
