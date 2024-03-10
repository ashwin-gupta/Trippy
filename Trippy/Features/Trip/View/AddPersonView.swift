//
//  AddPersonView.swift
//  Trippy
//
//  Created by Ashwin Gupta on 10/3/2024.
//

import SwiftUI

struct AddPersonView: View {
    
    @Binding var isActive: Bool
    @State private var offset: CGFloat = 1000
    @State private var colour = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    @State private var name: String = ""
    @State private var email: String = ""
    
    var body: some View {
        ZStack {
            Color(.systemGray)
                .opacity(0.3)
                .onTapGesture {
                    close()
                }
            
            VStack {
                Text("Add Person")
                    .font(.title2)
                    .bold()
                    .padding()
                
                VStack(spacing: 16) {
                    ColorPicker(selection: $colour) {
                        Text("Pick a Colour")
                            .fontWeight(.bold)
                            
                    }
                    InputView(text: $name, title: "Name", placeholder: "John Doe")
            
                    InputView(text: $email, title: "Email", placeholder: "john@email.com")
                }
                
                FillButton(text: "Add Person", backgroundColour: .inverse, foregroundColour: .buttonTextColour) {
                    // call viewModel
                }.padding(.top)
        
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button {
                            close()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .fontWeight(.medium)
                        }.tint(.black)
                    }
                    
                    Spacer()
                    
                }.padding()
                
            }
            .shadow(radius: 30)
            .padding(24)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func close() {
        withAnimation(.spring()) {
            offset = 1000
            isActive = false
        }
    }
}

#Preview {
    AddPersonView(isActive: .constant(true))
}
