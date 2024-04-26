//
//  ButtonView.swift
//  ToDoList
//
//  Created by Randy on 25/04/24.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let background: Color
    let textColor: Color
    let isBold: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(textColor)
                    .fontWeight(isBold ? .bold : .regular)
            }
        }
    }
}

//#Preview {
//    ButtonView()
//}
