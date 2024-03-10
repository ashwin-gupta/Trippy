//
//  LoginView.swift
//  Trippy
//
//  Created by Ashwin Gupta on 27/2/2024.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject var viewModel = AuthViewModel()
    
    @State private var path = NavigationPath()
    @State private var email: String = ""
    @State private var password: String = ""
    @State var isLoggedIn: Bool = false
    
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .center){
                Text("Trippy")
                    .font(.title)
                Image(systemName:"airplane")
                    .resizable()
                    .frame(width: 24, height: 24)
                
            }
            
            loginStackView
                .padding(.horizontal)
        }
        
    }
    
    var loginStackView: some View {
        VStack{
            TextField("email", text: $email)
                .textContentType(.emailAddress)
                .padding()
                .fontWeight(.bold)
                .background(Color(UIColor.systemGray4))
                .cornerRadius(8)
            
            SecureField("password", text: $password)
                .textContentType(.password)
                .padding()
                .fontWeight(.bold)
                .background(Color(UIColor.systemGray4))
                .cornerRadius(8)
            
            
            Button("Sign Up") {
//                Task {
//                    try await viewModel.createUser(withEmail: email, password: password, fullName: <#String#>)
//                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.black)
            .foregroundColor(.yellow)
            .cornerRadius(8)
            .fontWeight(.bold)
            .padding(.top)
            
            Button("Login") {
                Task {
                    try await viewModel.signIn(withEmail: email, password: password)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.yellow)
            .foregroundColor(.black)
            .cornerRadius(8)
            .fontWeight(.bold)
            
        }
    }
}

#Preview {
    
    AuthView()
}
