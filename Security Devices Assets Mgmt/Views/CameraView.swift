//
//  CameraView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/17/25.
//

import SwiftUI
import FirebaseCore

struct CameraView: View {
    
    let company: Company
    
    @State private var newCameraName: String = ""
    @StateObject var firebaseManager = FirebaseCameraViewModel.shared
    
    var body: some View {
        VStack{
            NavigationLink(destination: CameraAddView(company: company)) {
                Label("New Camera", systemImage: "plus")
                    .font(.headline)
                    .padding(8)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            //VStack{
                List(firebaseManager.cameras) { camera in
                    NavigationLink(destination: CameraDetailView(camera: camera)) {
                        CameraRowView(camera: camera)
                        EmptyView()
                    }
                //}
                //.onDelete(perform: deleteCamera)
                
                //HStack {
                    //TextField
                    //TextField("Enter a new Camera", text: $newCameraName)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    //Add button
                    //Button {
                        //if !newCameraName.isEmpty {
                            //firebaseManager.addCamera(name: newCameraName, for: company)
                            //reset the ToDo title
                            //newCameraName = ""
                        //}
                    //}
                    //label: {
                        //Image(systemName: "plus")
                    //}
                //}
            }
            .onAppear {
                firebaseManager.fetchCamerasCompany(for: company)
            }
            .padding()
            .navigationTitle("Cameras")
        }
    }
}


//#Preview {
//    CameraView()
//}
