//
//  LoginView.swift
//  Funds
//
//  Created by Jake Quinter on 7/23/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    
    @State private var isActive = false
    @State private var isPresented = false
    
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
                    TextField("Email", text: $loginViewModel.email)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    TextField("Password", text: $loginViewModel.password)
                        .textFieldStyle(.roundedBorder)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                        Button("Create one") {
                            isPresented = true
                        }
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
                
                
                Button(action: {
                    loginViewModel.login {
                        isActive = true
                    }
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                }
                .background(RoundedRectangle(cornerRadius: 8, style: .continuous).fill(Color("Emerald")))
                .foregroundColor(.white)
                
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), isActive: $isActive) {EmptyView().navigationBarBackButtonHidden()}
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
