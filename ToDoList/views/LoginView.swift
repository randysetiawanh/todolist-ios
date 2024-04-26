//
//  LoginView.swift
//  ToDoList
//
//  Created by Randy on 24/04/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(colorR: Double(AppConfig.BASE_BACKGROUND[0]),
                           colorG: Double(AppConfig.BASE_BACKGROUND[1]),
                           colorB: Double(AppConfig.BASE_BACKGROUND[2]),
                           title: AppConfig.BRAND,
                           subtitle: AppConfig.NAME_APP,
                           angle: 15)
                VStack {
                    Text("Welcome Back")
                        .font(.system(size: 30))
                        .fontWeight(.black)
                        .padding(.bottom, 25)
                    VStack(spacing: 16.0) {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                        }
                        
                        InputFieldView(data: $viewModel.email, title: "Email")
                            .padding(.horizontal, 20)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        InputFieldView(data: $viewModel.password, title: "Password")
                            .padding(.horizontal, 20)
                    }.padding(.bottom, 16)
                    
                    // Button Login
                    // Button Register
                    ButtonView(title: "Login",
                       background: .blue,
                       textColor: .white,
                       isBold: true,
                       action: {
                            viewModel.login()
                    }).padding(.horizontal, 20)
                    .frame(height: 50)
                }.offset(y: -70)
                
//                // Login Form
//                Form {
//                    // Field email and password
//                    TextField("Email Address", text: $email)
//                        .textFieldStyle(DefaultTextFieldStyle())
//                        .autocapitalization(.none)
//                    
//                    SecureField("Password", text: $password)
//                        .textFieldStyle(DefaultTextFieldStyle())
//                    
//                    
//                }
                
                // Create account
                VStack {
                    Text("Don't have account?")
                    NavigationLink("Create Account",
                       destination: RegisterView())
                }
                .padding(.bottom, 40)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
