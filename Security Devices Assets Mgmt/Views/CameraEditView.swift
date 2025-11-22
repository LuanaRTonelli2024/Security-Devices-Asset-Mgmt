//
//  CameraEditView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/20/25.
//

import SwiftUI
import FirebaseCore

struct CameraEditView: View {
    
    let company: Company
        
    @Environment(\.dismiss) var dismiss

    @StateObject var firebaseManager = FirebaseCameraViewModel.shared
        
    //Info Camera
    @Binding var camera: Camera
    //@State var camera: Camera
    //@State private var newCameraName: String = ""
    //@State private var newCameraLocation: String = ""
    //@State private var newCameraIPAddress: String = ""
    //@State private var newCameraSubnetMask: String = ""
    //@State private var newCameraDefaultGateway: String = ""
    //@State private var newCameraUserName: String = ""
    //@State private var newCameraPassword: String = ""
        
    //@State private var showSuccessMessage = false //success message
    @State private var selectedTab = "Info" //picker

    var body: some View {
        VStack {
            Picker("", selection: $selectedTab) {
                Text("Info").tag("Info")
                //Text("QR Code").tag("QR Code")
                Text("Reference View").tag("Reference View")
            }
            .pickerStyle(.segmented)
            .padding()
            
            if selectedTab == "Info" {
                Form {
                    Section("Basic Info"){
                        HStack {
                            Text("Name: ")
                            TextField("", text: $camera.name)
                        }
                        HStack {
                            Text("Location: ")
                            TextField("", text: $camera.location)
                        }
                    }
                    Section("Network Info"){
                        HStack{
                            Text("IP Address: ")
                            TextField("", text: $camera.ipAddress)
                        }
                        HStack {
                            Text("Subnet Mask: ")
                            TextField("", text: $camera.subnetMask)
                        }
                        HStack{
                            Text("Default Gateway: ")
                            TextField("", text: $camera.defaultGateway)
                        }
                    }
                    Section("Admin Info"){
                        HStack{
                            Text("User Name: ")
                            TextField("", text: $camera.userName)
                        }
                        HStack {
                            Text("Password: ")
                            TextField("", text: $camera.password)
                        }
                    }
                    
                    Button ("Save") {
                        firebaseManager.updateCamera(camera: camera)
                        //showSuccessMessage = true
                        dismiss()
                    }
                }
            }
            //else if selectedTab == "QR Code" {
            //    VStack {
            //        Text("QR Code View")
            //            .font(.headline)
            //        if let id = camera.id {
            //            QRCodeView(data: id)
            //        } else {
            //            Text("Camera ID not available")
            //                .foregroundColor(.red)
            //        }
            //
            //        Spacer()
            //    }
            //    .padding()
            //}
            else {
                VStack {
                    Text("Reference Camera View")
                        .font(.headline)
                    Spacer()
                }
                .padding()
            }
        }
        .padding()
    }
}

//#Preview {
//    CameraEditView()
//}
