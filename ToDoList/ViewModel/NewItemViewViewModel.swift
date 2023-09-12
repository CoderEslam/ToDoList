//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel : ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){
        
    }
    
    
    func save(){
        
        
        guard canSave else {
            return
        }
        
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        // craete a model
        let newId = UUID().uuidString
        let newTodo = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: false)
        
        // saving model
        let db  = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("ToDo")
            .document(newId)
            .setData(newTodo.asDictionary())
        
        
    }
    
    var canSave : Bool{
        
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
        
    }
    
}
