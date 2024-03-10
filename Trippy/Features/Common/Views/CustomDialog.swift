//
//  CustomDialog.swift
//  Trippy
//
//  Created by Ashwin Gupta on 10/3/2024.
//

import SwiftUI

struct CustomDialog: View {
    
    let title: String
    let description: String
    let buttonTitle: String
    let action: () -> ()
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .bold()
                .padding()
                    
                    Text(description)
                        .font(.body)
            

                    FillButton(text: buttonTitle, backgroundColour: .black, foregroundColour: .yellow, action: {
                        action()
                    }).padding()
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        
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
        .padding(30)
    }
}

#Preview {
    CustomDialog(title: "Access photos?", description: "This lets you choose photos blah blah blah balh", buttonTitle: "Give access") {
        
    }
}
