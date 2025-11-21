//
//  CameraDetailView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/17/25.
//

import SwiftUI

struct CameraDetailView: View {
    
    let company: Company
    //@State var camera: Camera
    @Binding var camera: Camera
    @State private var selectedTab = "Info"
    
    var body: some View {
        
        NavigationLink(destination: CameraEditView(company: company, camera: $camera)) {
            Label("Edit", systemImage: "edit")
                .font(.headline)
                .padding(8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
        }
        .padding(.horizontal)
        
        VStack {
            Picker("", selection: $selectedTab) {
                Text("Info").tag("Info")
                Text("QR Code").tag("QR Code")
                Text("Reference View").tag("Reference View")
            }
            .pickerStyle(.segmented)
            .padding()
                    
            if selectedTab == "Info" {
                Form {
                    Section("Basic Info"){
                        Text("Name:  \(camera.name)")
                        Text("Location: \(camera.location)")
                    }
                    Section("Network Info"){
                        Text("IP Address: \(camera.ipAddress)")
                        Text("Subnet Mask: \(camera.subnetMask)")
                        Text("Default Gateway: \(camera.defaultGateway)")
                    }
                    Section("Admin Info"){
                        Text("User Name: \(camera.userName)")
                        Text("Password: \(camera.password)")
                    }
                }
            }
            else if selectedTab == "QR Code" {
                VStack {
                    Text("QR Code View")
                        .font(.headline)
                    if let id = camera.id {
                        QRCodeView(data: id)
                    } else {
                        Text("Camera ID not available")
                            .foregroundColor(.red)
                    }

                    Spacer()
                    }
                    .padding()
            }
            else {
                VStack {
                    Text("Reference Camera View")
                        .font(.headline)
                    Spacer()
                }
                .padding()
            }
        }
    }
}


//#Preview {
//    CameraDetailView()
//}
