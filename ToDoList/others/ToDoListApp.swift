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
    @State private var showMainView = false
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if showMainView {
                MainView()
            } else {
                LaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                self.showMainView = true
                            }
                        }
                    }
            }
        }
    }
}
