//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Randy on 24/04/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
             MainView()
        }
    }
}
