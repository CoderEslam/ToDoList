//
//  TLButton.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import SwiftUI

struct TLButton: View {
    
    let title : String
    let background : Color
    let action:()->Void
    
    var body: some View {
        Button{
            // login
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }.padding(.top,20)
            .padding(.bottom,10)
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title:"Title", background: .blue){
            // Action
        }
        
    }
}
