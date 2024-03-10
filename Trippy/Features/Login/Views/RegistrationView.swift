//
//  RegistrationView.swift
//  FirebaseAuthExample
//
//  Created by Ashwin Gupta on 3/3/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack {
            Image(systemName: "airplane")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.vertical, 32)
            
            VStack(spacing: 24) {
                
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                
                InputView(text: $fullName,
                          title: "Full Name",
                          placeholder: "Enter your name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your password",
                              isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                        }
                    }
                }
                
                
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            FillButton(text: "SIGN UP", backgroundColour: .inverse, foregroundColour: .buttonTextColour) {
                Task {
                    try await viewModel.createUser(withEmail: email, password: password, fullName: fullName)
                }
            }    .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(Constants.UI.cornerRadius)
                .padding(.horizontal)
                .padding(.top, 24)

            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }.font(.system(size: 14))
                    .foregroundColor(.inverse)
            }
        }
    }
}

// MARK: - AuthenticationFormProtocol

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullName.isEmpty
    }
}

#Preview {
    RegistrationView()
}
