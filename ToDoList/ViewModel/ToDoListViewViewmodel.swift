//
//  ToDoListViewViewmodel.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//


import Foundation
import FirebaseFirestore

class ToDoListViewViewModel : ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId :String
    
    init(userId:String){
        self.userId = userId
    }
    
    func delete(id:String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("ToDo")
            .document(id)
            .delete()
    }
    
    
    
    
    
    
    
    
}
