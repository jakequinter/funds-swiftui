//
//  LoginView.swift
//  Funds
//
//  Created by Jake Quinter on 7/23/22.
//

import SwiftUI

struct LoginView: View {
    @State private var isPresented = false
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "dollarsign.square.fill")
                    .font(.system(size: 80))
                    .foregroundColor(Color("Emerald"))
                
                Text("Login to funds")
                    .font(.system(size: 24).bold())
                    .padding(.top, 8)
                
                VStack(alignment: .leading) {
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                    
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                        Button("Create one") {
                            isPresented = true
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
            .sheet(isPresented: $isPresented) {
                RegisterView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
