//
//  ContentView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/13/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var auth = AuthService.shared
    @State private var isLoaded = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Image("cctv")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Security Devices")
                .font(.system(.largeTitle))
                .bold()
            Text("Asset Management")
                .font(.system(.largeTitle))
                .bold()
            NavigationLink(destination: LoginView()) {
                Text("Login")
                    .padding()
                    .frame(maxWidth: .infinity)
                    //.background(Color(hex: "#233ABAFF"))
                    .foregroundColor(.white)
                    .cornerRadius(8) }
            HStack {
                Text("Don't have an account?")
                NavigationLink(destination: RegisterView()) {
                    Text("Register here")
                        .underline()
                        .foregroundColor(.blue)
                        .font(.system(.body))
                        .fontWeight(.medium)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
