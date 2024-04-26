//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Randy on 24/04/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItemModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id: "123",
        title: "get get",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: true
    ))
}
