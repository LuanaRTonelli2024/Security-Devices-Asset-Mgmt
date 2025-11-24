//
//  HomeView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/18/25.
//

import SwiftUI
import FirebaseAuth
//import FirebaseCore
//import FirebaseFirestore

struct HomeView: View {
    
    
    @EnvironmentObject var authManager: AuthManager
    @StateObject var firebaseManager = FirebaseCompanyViewModel.shared
    
    enum Tab { case home, companies, profile}
    
    @State private var selected: Tab = .home
    @State private var isSearching: Bool = false //for the search box
    @State private var query: String = "" //will be binded ($query) to the textfield
    @FocusState private var searchFocused: Bool //this is will initia
    

    var body: some View {
        ZStack {
            Group {
                switch selected {
                    
                case .home:
                    NavigationStack {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Welcome \(authManager.currentUser?.displayName ?? "User")")
                                .font(.largeTitle)
                                .background(Color(.systemBackground))
                            //Text("\(authManager.currentUser?.displayName ?? "User")")
                            //    .font(.title)
                            //    .background(Color(.systemBackground))
                            //Text("Security Devices Asset Management")
                            //    .font(.largeTitle.bold())
                            //    .background(Color(.systemBackground))
                                                            
                            Text("Please select the company:")
                                .font(.title2)
                                .background(Color(.systemBackground))
                                .foregroundStyle(.secondary)
                        }
                        .padding(.top, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .onAppear {
                            authManager.fetchCurrentAppUser { _ in }
                        }

                        List(firebaseManager.companies) { company in
                            NavigationLink(destination: CameraView(company: company)) {
                                Label(company.name, systemImage: "building")
                                    .font(.body)
                            }
                        }
                    }
                    
                case .companies:
                    CompanyView()
                    
                case .profile:
                    ProfileView()
                    //VStack{
                    //    Text("Welcome \(authManager.user?.email ?? "User")")
                    //        .font(.title)
                    //        .padding()
                        
                    //    Button {
                    //        authManager.logout()
                    //    }
                    //    label: {
                    //        Text("Logout")
                    //            .foregroundStyle(.white)
                    //            .background(.red)
                    //            .padding()
                    //            .cornerRadius(10)
                    //    }
                        
                    //    Spacer()
                    //}
                        
//                case .search:
//                    VStack(alignment: .leading, spacing: 12){
//                        Text("Search")
//                            .font(.largeTitle.bold())
//
//                        if query.isEmpty{
//                            Text("Type Something to Search...")
//                                .foregroundStyle(.secondary)
//                        } else {
//                            Text("Results for: \(query)")
//                                .foregroundStyle(.secondary)
//                        }
//
//                        Spacer()
//                    }
//                    .padding()
 //                   .background(Color(.systemBackground))
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            
            //Floating Botton Navigation
            VStack{
                Spacer() //push down everything
                HStackLayout(spacing: 20){
                    Spacer()
                    //Home
                    TabButton(title: "Home", system: "house.fill", active: selected == .home) {
                        withAnimation(.easeInOut) {
                            selected = .home
                            
                            //collapse the search box
                            //collapseSearch()
                        }
                    }
                    
                    //Companies
                    TabButton(title: "Companies", system: "building.2.fill", active: selected == .companies) {
                        withAnimation(.easeInOut) {
                            selected = .companies
                            
                            //collapse the search box
                            //collapseSearch()
                        }
                    }
                    
                    //Profile
                    TabButton(title: "Profile", system: "person.crop.circle", active: selected == .profile) {
                        withAnimation(.easeInOut) {
                            selected = .profile
                            
                            //collapse the search box
                            //collapseSearch()
                        }
                    }
                    
                    //Spacer
                    Spacer()//minLength: 0)
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.12), radius: 20, x: 0, y: 8)
                .padding(.horizontal)
            }.padding(.top, 0)
        }
    }
}

//custom Tab View
struct TabButton: View {
    let title: String
    let system: String //system image name
    let active: Bool //button is clicked or not
    let action: () -> Void //a null type function
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4){
                Image(systemName: system)
                    .font(.system(size: 18, weight: .semibold))
                
                Text(title)
                    .font(.caption2.bold())
            }
            .foregroundStyle(active ? .blue : .secondary)
            .frame(width: 72)
            .padding(.vertical, 2)
        }.buttonStyle(.plain)
    }
}
    
//#Preview {
//    HomeView()
//}
