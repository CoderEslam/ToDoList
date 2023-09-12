//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewmodel : ToDoListViewViewModel
    @FirestoreQuery var items :[ToDoListItem]
    
    
    private let userId :String
    init(userId:String){
        self.userId = userId
        //users/<uid>/todo/entires
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/ToDo")
        self._viewmodel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack{
                
                List(items){item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button{
                                viewmodel.delete(id: item.id)
                            }label: {
                                Text("Delete")
                                    .foregroundColor(Color.red)
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    // Action
                    viewmodel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            // working as buttom sheet
            .sheet(isPresented: $viewmodel.showingNewItemView){
                NewItemView(newItemPresented: $viewmodel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "nX1SVkIR1GhdyAA31XctMR2c2592")
    }
}
