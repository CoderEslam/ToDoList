//
//  LoginViewViewMdel.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel : ObservableObject{
    
    // instad of @State -> @Published
    
    @Published var email :String = ""
    @Published var password :String = ""
    @Published var errorMessage = ""
    
    init() {
    }
    
    func login() {
        
        guard vaildate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func vaildate() -> Bool {
        
    
        
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty ,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            return false;
            
        }
        
        guard email.contains("@") && email.contains(".") else {
            
            errorMessage = "Please enter vaild email."
            return false
        }
        
        return true;
        
    }
    
}
