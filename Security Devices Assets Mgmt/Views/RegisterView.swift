//
//  RegisterView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/17/25.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var displayName = ""
    @EnvironmentObject var authManager: AuthManager
    @State private var errorMessage: String?
    
    var body: some View {
        VStack(spacing: 20){
            //Spacer()
            Text("Please fill in the fields below")
                .font(.headline)
            //.foregroundStyle()
            
            TextField("Enter Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
            
            SecureField("Enter password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            TextField("Enter display Name", text: $displayName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                print("Register clicked")
                guard Validators.isEmailValid(email) else {
                    self.errorMessage = "Invalid Email"
                    return
                }
                guard Validators.isValidPassword(password) else {
                    self.errorMessage = "Invalid Password"
                    return
                }
                authManager.register(email: email, password: password, displayName: displayName) { result in
                    switch result {
                    case .success:
                        self.errorMessage = nil
                    case .failure(let failure):
                        self.errorMessage = failure.localizedDescription
                    }
                }
            }){
                RoundedRectangle(cornerRadius: 10)
                    .fill(email.isEmpty || password.isEmpty || displayName.isEmpty ? .gray : .blue)
                    //.fill(.blue)
                    .frame(height: 50)
                    .overlay(
                        Text("Register")
                            .foregroundColor(.white)
                            .font(.headline)
                    )
                
            }
            .disabled(email.isEmpty || password.isEmpty || displayName.isEmpty)
            .padding(.horizontal)
            
            if let errorMessage = errorMessage {
                Text(errorMessage).foregroundStyle(.red)
            }
            
            Spacer()
        }
        .padding()
    }
}


//#Preview {
//    RegisterView()
//}
