//
//  LaunchScreen.swift
//  ToDoList
//
//  Created by Randy on 26/04/24.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        VStack {
            VStack {
                Image("Rencores")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                Text("TO DO LIST")
                    .font(Font.custom("Baskerville-Bold", size: 30))
                    .foregroundColor(.black.opacity(0.80))
                    .padding()
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 2)) {
                    self.size = 1.3
                    self.opacity = 1.0
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isActive = true
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
