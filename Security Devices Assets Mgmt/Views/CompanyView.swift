//
//  CompanyView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/23/25.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct CompanyView: View {
    
    @StateObject var firebaseManager = FirebaseCompanyViewModel.shared //Firebase
    @State private var showNewCamera = false

    
       
    var body: some View {
        VStack{
            List {
                ForEach(firebaseManager.companies) { company in
                    HStack{
                        //title
                        Text(company.name)
                        
                        //spacer
                        Spacer()
                    }
                }
            }
            .onAppear {
                firebaseManager.fetchCompanies()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack{
                        Button {
                            showNewCamera = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .sheet(isPresented: $showNewCamera){
                CompanyAddView()
            }
            .navigationTitle("Companies")
            .padding()
        }
    }
}


//#Preview {
//    CompanyView()
//}
