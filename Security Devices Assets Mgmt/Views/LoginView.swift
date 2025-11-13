//
//  LoginView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/17/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @StateObject private var auth = AuthService.shared
    
    var body: some View {
        VStack{
            TextField("Enter Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            
            SecureField("Enter password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            // error message if I have any
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .font(.caption)
            }
            
            if let errorMessage = errorMessage {
                Text(errorMessage).foregroundStyle(.red)
            }
                
            Button("Login") {
                print("Login clicked")
                guard Validators.isEmailValid(email) else {
                    self.errorMessage = "Invalid Email"
                    return
                }
                guard Validators.isValidPassword(password) else {
                    self.errorMessage = "Invalid Password"
                    return
                }
                auth.login(email: email, password: password) { result in
                    switch result {
                    case .success:
                        self.errorMessage = nil
                    case .failure(let failure):
                           self.errorMessage = failure.localizedDescription
                    }
                }
            }
            .disabled(email.isEmpty || password.isEmpty)
        }
    }
}

//#Preview {
//    LoginView()
//}
