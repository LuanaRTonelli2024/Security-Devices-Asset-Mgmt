//
//  CameraView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/17/25.
//

import SwiftUI
import FirebaseCore
import CodeScanner

struct CameraView: View {
    
    let company: Company //companyID
    
    @StateObject var firebaseManager = FirebaseCameraViewModel.shared //Firebase
    
    //scanning QR code
    @State private var isShowingScanner = false
    @State private var scannedCode: String?
    
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
                if filteredCameraIndices.isEmpty, scannedCode != nil {
                    Text("No camera found for this QR code.")
                        .foregroundColor(.red)
                } else {
                    ForEach(filteredCameraIndices, id: \.self) { index in
                        NavigationLink(
                            destination: CameraDetailView(company: company, camera: $firebaseManager.cameras[index])
                        ) {
                            VStack(alignment: .leading) {
                                Text(firebaseManager.cameras[index].name)
                                    .font(.headline)
                                Text(firebaseManager.cameras[index].location)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }

            HStack {
                Button("Scan QR Code") {
                    isShowingScanner = true
                }
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(
                        codeTypes: [.qr],
                        simulatedData: "gmssxysHg6SDXix2o9Gg",
                        completion: handleScan
                    )
                }
                
                
            }
        }
        .onAppear {
            firebaseManager.fetchCamerasCompany(for: company)
        }
        .onChange(of: firebaseManager.cameras.count) {
            if scannedCode != nil {
                scannedCode = nil
            }
        }
        .navigationTitle("Cameras")
        .padding()
    }
    
    
    private var filteredCameraIndices: [Int] {
        if let scannedCode = scannedCode,
           let camera = firebaseManager.getCameraById(scannedCode),
           let index = firebaseManager.cameras.firstIndex(where: { $0.id == camera.id }) {
            return [index]
        } else if scannedCode != nil {
            return [] // Nenhuma encontrada
        } else {
            return Array(firebaseManager.cameras.indices)
        }
    }

    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let scanResult):
            scannedCode = scanResult.string
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}


//#Preview {
//    CameraView()
//}
