//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Randy on 25/04/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class MainViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                self?.checkUserExists()
            }
        }
    }
    
    public var isSignedIn: Bool {
        print(Auth.auth().currentUser ?? "")
        return Auth.auth().currentUser != nil
    }
    
    private func checkUserExists() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        let db = Firestore.firestore()
        
        // Query to check if user exists in Firestore
        db.collection("users").document(currentUser.uid).getDocument { [weak self] (document, error) in
            if let document = document, document.exists {
                // User exists in Firestore
                print("User exists")
            } else {
                // User does not exist in Firestore
                print("User does not exist, logging out...")
                do {
                    try Auth.auth().signOut()
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
                // Clear currentUserId
                self?.currentUserId = ""
            }
        }
    }
}
