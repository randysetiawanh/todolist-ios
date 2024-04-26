//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Randy on 24/04/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItemModel]
    @State private var isShowingDialog = false
    
//    private let userId: String
    
    init(userId: String) {
//        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Image(systemName: "trash")
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

//#Preview {
//    ToDoListView(userId: "svaOIURIjGWMGkjKlO01LVp5FBr1")
//}
