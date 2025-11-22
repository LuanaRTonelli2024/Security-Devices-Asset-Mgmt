//
//  HomeView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/18/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct HomeView: View {
    
    //enum Tab { case home, settings, search }
    
    @EnvironmentObject var authManager: AuthManager
    @State private var newCompanyName: String = ""
    @StateObject var firebaseManager = FirebaseCompanyViewModel.shared
    
    //@State private var selected: Tab = .home
    //@State private var isSearching: Bool = false //for the search box
    //@State private var query: String = "" //will be binded ($query) to the textfield
    //@FocusState private var searchFocused: Bool //this is will initia

    
    var body: some View {
        //ZStack(){
        VStack{
            Text("Welcome \(authManager.user?.email ?? "User")")
                .font(.title)
                .padding()
            
            Button {
                authManager.logout()
            }
            label: {
                Text("Logout")
                    .foregroundStyle(.white)
                    .background(.red)
                    .padding()
                    .cornerRadius(10)
            }
            
            Text("Please select the company: ")
            
            List(firebaseManager.companies) { company in
                NavigationLink(destination: CameraView(company: company)) {
                    HStack {
                        Text(company.name)
                        Spacer()
                        EmptyView()
                    }
                }
            }
            
            HStack {
                //TextField
                TextField("Enter a new Company", text: $newCompanyName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                //Add button
                Button {
                    if !newCompanyName.isEmpty {
                        firebaseManager.addCompany(name: newCompanyName)
                        //reset the Company name
                        newCompanyName = ""
                    }
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .onAppear {
            if !firebaseManager.companies.isEmpty {
                Task {
                    firebaseManager.fetchCompanies()
                }
            }
        }
        .padding()
    }
}

    
//#Preview {
//    HomeView()
//}
