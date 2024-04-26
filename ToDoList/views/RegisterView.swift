//
//  RegisterView.swift
//  ToDoList
//
//  Created by Randy on 24/04/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(colorR: Double(AppConfig.BASE_BACKGROUND[0]),
                       colorG: Double(AppConfig.BASE_BACKGROUND[1]),
                       colorB: Double(AppConfig.BASE_BACKGROUND[2]),
                       title: AppConfig.BRAND,
                       subtitle: "Register Account",
                       angle: -15)
            
            VStack {
                Text("Create an Account")
                    .font(.system(size: 25))
                    .fontWeight(.black)
                    .padding(.bottom, 25)
                VStack(spacing: 16.0) {
                    InputFieldView(data: $viewModel.fullName, title: "Full Name")
                        .padding(.horizontal, 20)
                        .autocorrectionDisabled()
                    InputFieldView(data: $viewModel.email, title: "Email")
                        .padding(.horizontal, 20)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    InputFieldView(data: $viewModel.password, title: "Password")
                        .padding(.horizontal, 20)
                }.padding(.bottom, 16)
                
                // Button Register
                ButtonView(title: "Register",
                   background: .blue,
                   textColor: .white,
                   isBold: true,
                   action: {
                        viewModel.register()
                }).padding(.horizontal, 20)
                .frame(height: 50)
            }.offset(y: -100)
        
            Spacer()
        }.padding(.top, -20)
    }
}

#Preview {
    RegisterView()
}
