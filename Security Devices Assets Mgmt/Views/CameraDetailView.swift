//
//  CameraDetailView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/17/25.
//

import SwiftUI

struct CameraDetailView: View {
    
    let camera: Camera
    
    var body: some View {
        Form {
            Section("Basic Info"){
                Text(camera.name)
                Text(camera.location)
            }
            Section("Network Info"){
                Text(camera.ipAddress)
                Text(camera.subnetMask)
                Text(camera.defaultGateway)
            }
            Section("Admin Info"){
                Text(camera.userName)
                Text(camera.password)
            }
        }
    }
}

//#Preview {
//    CameraDetailView()
//}
