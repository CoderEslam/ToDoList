//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import Foundation
import FirebaseAuth

class MainViewViewModel :ObservableObject{
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            // to do in background thread
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignIn :Bool{
        return Auth.auth().currentUser != nil
    }
    
    func signOut(){
            do {
               try  Auth.auth().signOut()
            } catch {
            
            }
    }
    
}
