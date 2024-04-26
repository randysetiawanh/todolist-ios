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
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                }
            }.navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Spacer()
        
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width:125, height: 125)
        
        // Info
        VStack(alignment: .leading) {
            HStack {
                Text("Full Name:")
                Text(user.fullName)
            }.padding(.top, 3)
            
            HStack {
                Text("Email:")
                Text(user.email)
            }.padding(.top, 3)
            
            HStack {
                Text("Member Since:")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding(.top, 3)
        }.padding(.top, 20)
        
        ButtonView(title: "Logout",
            background: .red,
            textColor: .white,
            isBold: true,
            action: {
                viewModel.logout()
            }
        )
        .frame(width: 125, height: 45)
        .padding(.top, 25)
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
