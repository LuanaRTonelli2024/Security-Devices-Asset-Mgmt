//
//  Security_Devices_Assets_MgmtApp.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/13/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Security_Devices_Assets_MgmtApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authManager = AuthManager()
    
    var body: some Scene {
        WindowGroup {
            AuthGate()
                .environmentObject(AuthManager())
        }
    }
}
