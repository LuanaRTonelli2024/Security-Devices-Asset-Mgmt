//
//  AppEntryView.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/18/25.
//

import SwiftUI

struct AppEntryView: View {
   
    @StateObject private var auth = AuthService.shared
    @State private var isLoaded = false
      
      var body: some View {
          Group {
              if !isLoaded {
                  ProgressView()
                      .onAppear {
                          auth.fetchCurrentAppUser { _ in
                              isLoaded = true
                          }
                      }
                  }
              else if auth.currentUser == nil {
                  //login/register screen
                  // switcher
                  LoginView()
              }
              else {
                  HomeView()
              }
          }    }
}

//#Preview {
//    AppEntryView()
//}
