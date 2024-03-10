//
//  LoginView.swift
//  FirebaseAuthExample
//
//  Created by Ashwin Gupta on 3/3/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                // image
                
                HStack {
                    Text("Trippy")
                        .font(.title)
                    Image(systemName: "airplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.vertical, 32)
                    
                }

                // form fields
                VStack(spacing: 24) {
                    
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                // sign in button
                
                FillButton(text: "Sign In", backgroundColour: .inverse, foregroundColour: .buttonTextColour) {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                }
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .padding(.horizontal)
                .padding(.top, 24)
                
                Spacer()
                
                
                // sign up button
                
                NavigationLink {
                    
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Dont have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }.font(.system(size: 14))
                        .foregroundColor(.inverse)
                }

            }
        }
    }
}

// MARK: - AuthenticationFormProtocol

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
