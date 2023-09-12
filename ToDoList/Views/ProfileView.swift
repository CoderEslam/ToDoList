//
//  ProfileView.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @StateObject var viewmodel = ProfileViewViewModel()

    
    var body: some View {
        NavigationView {
            VStack{
                if let user = viewmodel.user{
                    profile(user: user)
                }
                else{
                    Text("Loading...")
                }
                
            }
            .navigationTitle("Profile")
        }.onAppear{
            viewmodel.fetchUser()
        }
        
    }
    
    @ViewBuilder
    func profile(user:User) -> some View{
        // Avater
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125,height: 125)
        
        VStack(alignment: .leading){
            
            HStack{
                Text("Name")
                    .bold()
                Text(user.name)
                
                
            }
            .padding()
            HStack{
                Text("Email")
                    .bold()
                Text(user.email)
                
            }
            .padding()
            HStack{
                Text("Member since")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                
            }.padding()
            
            
        }.padding()
        
         TLButton(title: "Log out", background: .blue){
            viewmodel.signOut()
        }.frame(width: .infinity,height: 80)
            .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
