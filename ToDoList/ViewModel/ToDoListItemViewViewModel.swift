//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
// ViewModel for single to do list item view (each row in item list)
class ToDoListItemViewViewModel : ObservableObject {
    
    init(){
        
    }
    
    
    func toggleIsDone(item :ToDoListItem){
        var copy_item = item
        copy_item.setDone(state: !item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("ToDo")
            .document(item.id)
            .setData(copy_item.asDictionary())
    }
    
}
