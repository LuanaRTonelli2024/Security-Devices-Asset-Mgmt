//
//  CameraGate.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/17/25.
//

import SwiftUI

struct CameraGate: View {
    
    let camera: Camera
    
    @State private var showCamera = true
    
    
    var body: some View {
        VStack {
            Picker("", selection: $showCamera){
                Text("Details").tag(true)
                Text("QR Code").tag(false)
                Text("Imageview").tag(false)
            }
            .pickerStyle(.segmented)
            .padding()
            
            if showCamera {
                CameraDetailView(camera: camera)
            }
            else {
                RegisterView()
            }
        }
    }
}

