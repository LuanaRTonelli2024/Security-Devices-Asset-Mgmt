//
//  AuthManager.swift
//  Security Devices Assets Mgmt
//
//  Created by user285344 on 11/18/25.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

class AuthManager: ObservableObject {
    
    @Published var user: User? // User -> FirebaseAuth.User
    
    private let db = Firestore.firestore()
    
    @Published var currentUser: AppUser?
    
    init() {
        self.user = Auth.auth().currentUser
    }
    
    // register
    // email, password
    func register(email: String, password: String, displayName: String, completion: @escaping (Result<User, Error>) -> Void){
        //@escaping makes yhis func async
        // Result --> user or error
        Auth.auth().createUser(withEmail: email, password: password) {result, error in
            if let error = error {
                completion(.failure(error))
            }
            //guard statement for user
            guard let user = result?.user else {
                return completion(.failure(SimpleError("Unable to create the user"))) //Custom error
            }
            //Uid from the FirebaseAuth.user
            let uid = user.uid
            let appUser = AppUser(id: uid, email: email, displayName: displayName)
            //AppUser to Firestore
            do {
                try self.db.collection("users").document(uid).setData(from: appUser) {
                    error in
                    if let error = error {
                        print(error.localizedDescription)
                        completion(.failure(error))
                    }
                    DispatchQueue.main.async {
                        self.currentUser = appUser //will update currentuser in the main thread
                    }
                    completion(.success(user))
                }
            }
            catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    //login
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password:password) { result, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let user = result?.user {
                self.user = user
                completion(.success(user))
            }
        }
    }
    
    //logout/signout
    func logout(){
        do {
            try Auth.auth().signOut()
            self.user = nil
        }
        catch {
            print("Error Signing out: \(error.localizedDescription)")
        }
    }
}
