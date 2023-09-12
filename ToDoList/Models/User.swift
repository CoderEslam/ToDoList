//
//  User.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import Foundation


struct User :Codable{
    
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
