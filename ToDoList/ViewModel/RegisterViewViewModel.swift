//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject{
    
    @Published var fullName :String = ""
    @Published var email :String = ""
    @Published var password :String = ""
    
    
    func register() {
        
        guard vaildate() else {
            return
        }
        // weak -> it's mean maybe nil
        Auth.auth().createUser(withEmail: email, password: password){ [weak self]result , error in
            guard let userId = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userId)
        }
        
    }
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: fullName, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users").document(id)
            .setData(newUser.asDictionary())
    }
    
    private func vaildate() -> Bool {

        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty ,
              !email.trimmingCharacters(in: .whitespaces).isEmpty ,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false;
            
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6  else {
            return false
        }
        
        return true;
        
    }
    
    
    
}


