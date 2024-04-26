//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Randy on 24/04/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItemModel) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
