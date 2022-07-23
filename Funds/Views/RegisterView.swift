//
//  RegisterView.swift
//  Funds
//
//  Created by Jake Quinter on 7/23/22.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email = ""
    @State private var password = ""
    
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
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                    
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                        Button("Sign up") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
                
                
                Button("Login") { }
                    .padding(8)
                    .frame(maxWidth: .infinity)
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
