//
//  UserModel.swift
//  ToDoList
//
//  Created by Randy on 24/04/24.
//

import Foundation

struct User: Codable {
    let id: String
    let fullName: String
    let email: String
    let joined: TimeInterval
}
