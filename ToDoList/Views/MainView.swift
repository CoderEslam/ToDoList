//
//  ContentView.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
   
        VStack {
            if viewModel.isSignIn ,!viewModel.currentUserId.isEmpty{
                accountView
            }else{
                LoginView()
            }
        }
    
    }
    
    // funcyion return View 
    @ViewBuilder
    var accountView :some View{
        TabView{
            ToDoListView(userId : viewModel.currentUserId).tabItem {
                Label("Home",systemImage: "house")
            }
            
            
            ProfileView().tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
