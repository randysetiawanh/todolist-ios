//
//  ProfileView.swift
//  ToDoList
//
//  Created by Randy on 24/04/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile!")
            }.navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
