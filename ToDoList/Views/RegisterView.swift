//
//  RegisterView.swift
//  ToDoList
//
//  Created by Eslam Ghazy on 31/7/23.
//

import SwiftUI

struct RegisterView: View {

    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            // Header
            HeaderView(title: "Register",
                       subTitle: "Start organizaing todos",
                       angle: -15,
                       backgroun: Color.orange)
            
            // form
            Form{
                
                TextField("Full name",text: $viewModel.fullName).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top,10)
                
                TextField("Email Address",text: $viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top,10)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password",text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top,10)
                
                TLButton(title: "Register", background: .green){
                    // Action
                    viewModel.register()
                }.padding()
            }
            // create account
            
            
            Spacer()
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
