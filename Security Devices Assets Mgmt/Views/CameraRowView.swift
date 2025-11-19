//
//  CameraRowView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/17/25.
//

import SwiftUI

struct CameraRowView: View {
    
    let camera: Camera
    
    var body: some View {
        HStack {
            VStack(){
                Text(camera.name)
                    .font(.headline)
                Text(camera.location)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding(.horizontal, 25)
    }

}


//#Preview {
//    CameraRowView()
//}
