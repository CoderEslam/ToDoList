//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    let item : ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }.padding(.horizontal,10)
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle").foregroundColor(Color.blue)
            }
            
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(
         id: "123",
         title: "Title",
         dueDate: Date().timeIntervalSince1970,
         createDate: Date().timeIntervalSince1970,
         isDone: false)
        )
    }
}
