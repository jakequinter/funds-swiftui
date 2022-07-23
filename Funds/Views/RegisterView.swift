//
//  RegisterView.swift
//  Funds
//
//  Created by Jake Quinter on 7/23/22.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var registerViewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "dollarsign.square.fill")
                    .font(.system(size: 80))
                    .foregroundColor(Color("Emerald"))
                
                Text("Create an account")
                    .font(.system(size: 24).bold())
                    .padding(.top, 8)
                
                VStack(alignment: .leading) {
                    TextField("Email", text: $registerViewModel.email)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    TextField("Password", text: $registerViewModel.password)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                        Button("Sign in") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
                
                
                Button(action: {
                    registerViewModel.createAccount {
                        presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .background(RoundedRectangle(cornerRadius: 8, style: .continuous).fill(Color("Emerald")))
                .foregroundColor(.white)
            }
            .padding()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
