//
//  ToDoListItemModel.swift
//  ToDoList
//
//  Created by Randy on 26/04/24.
//

import Foundation

struct ToDoListItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
