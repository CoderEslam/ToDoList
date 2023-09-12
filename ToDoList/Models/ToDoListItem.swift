//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import Foundation

struct ToDoListItem :Codable ,Identifiable {
    
    let id: String
    let title:String
    let dueDate:TimeInterval
    let createDate :TimeInterval
    var isDone: Bool
    
    
    
    mutating func setDone(state:Bool){
        self.isDone = state
    }
    
}




