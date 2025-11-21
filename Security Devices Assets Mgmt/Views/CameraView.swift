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
    
    //@State private var newCameraName: String = ""
    @StateObject var firebaseManager = FirebaseCameraViewModel.shared
    //@State private var selectedCamera: Camera? = nil
    //@State private var isEditing = false //swipe action
    
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
            
            List {
                ForEach($firebaseManager.cameras) { $camera in
                    NavigationLink(destination: CameraDetailView(company: company, camera: $camera)) {
                        VStack(alignment: .leading) {
                            Text(camera.name)
                                .font(.headline)
                            Text(camera.location)
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
        .onAppear {
            firebaseManager.fetchCamerasCompany(for: company)
        }
        .navigationTitle("Cameras")
        .padding()
    }
}


//#Preview {
//    CameraView()
//}
