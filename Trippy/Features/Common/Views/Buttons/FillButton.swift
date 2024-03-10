//
//  RoundedButton.swift
//  Trippy
//
//  Created by Ashwin Gupta on 4/3/2024.
//

import SwiftUI

struct FillButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let text: String
    let backgroundColour: Color
    let foregroundColour: Color
    let action: () -> ()
    var body: some View {
        Button(action: action) {
          HStack {
            Spacer()
            Text(text)
                  .fontWeight(.bold)
            Spacer()
          }
          .contentShape(RoundedRectangle(cornerRadius: 8))
          .padding()
          .background(backgroundColour)
          .foregroundColor(foregroundColour)
          
        }.cornerRadius(10)
    }
}

#Preview {
    FillButton(text: "Button", backgroundColour: Color("Inverse"), foregroundColour: Color(.systemYellow)) {
        print("Button Pressed")
    }
}
