//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
