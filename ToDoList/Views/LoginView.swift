//
//  LoginView.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
   
    
    var body: some View {
        NavigationView {
            VStack{
                
                // Header
                HeaderView(title: "To Do List",
                           subTitle: "Get thing done",
                           angle: 15,
                           backgroun: Color.pink)
                
                
                //Login form
                
                
                Form{
                    
                    if  !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    
                    TextField("Email Address",text: $viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top,10)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password",text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top,10)
                    
                    TLButton(title: "Log In", background: .blue){
                        // Action
                        viewModel.login()
                    }.padding()
                }
                
                // create account
                
                VStack{
                    
                    Text("New arround account")
                
                    NavigationLink(/*label*/"Create an account", destination: {
                        // go to aonther screen
                        RegisterView()
                    })
                    
                }.padding(.bottom,50)
                Spacer()
                
                
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
