//
//  InputFieldView.swift
//  ToDoList
//
//  Created by Randy on 24/04/24.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var data: String
    var title: String?
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
      ZStack {
          if title == "Password" {
              SecureField("", text: $data)
                  .padding(.horizontal, 10)
                  .frame(height: 42)
                  .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                            .stroke(Color.gray, lineWidth: 1)
                  )
          } else {
              TextField("", text: $data)
                  .padding(.horizontal, 10)
                  .frame(height: 42)
                  .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                            .stroke(Color.gray, lineWidth: 1)
                  )
          }
          
          HStack {
              Text(title ?? "Input")
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(4)
                    .background(colorScheme == .dark ? .black : .white)
              Spacer()
          }.padding(.leading, 8)
           .offset(CGSize(width: 0, height: -20))
        }.padding(4)
    }
}

//#Preview {
//    InputFieldView()
//}
