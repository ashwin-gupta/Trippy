//
//  AirplaneProgressView.swift
//  Trippy
//
//  Created by Ashwin Gupta on 27/2/2024.
//

import SwiftUI

struct AirplaneProgressView: View {
    
    @State private var containerWidth: CGFloat = 0
    
    var maxWidth: Double {
        return min((containerWidth / CGFloat(goal) * CGFloat(progress)), containerWidth)
    }
    
    var goal = 365
    
    @State var progress = 100
    
    var body: some View {
        
        
        
        ZStack(alignment: .leading) {
            
            GeometryReader { geo in
                    RoundedRectangle(cornerRadius: 60)
                    .foregroundColor(.clear)
                    .onAppear{
                        containerWidth = geo.size.width
                    }
            }
            
            RoundedRectangle(cornerRadius: 60)
                .stroke(.gray, lineWidth: 1)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 50).fill(.yellow).fixedSize(horizontal: false, vertical: true)
                
                Image(systemName: "airplane")
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
                    .background(
                        Circle().fill())
                    
            }
            .padding(0)
            .frame(minWidth: maxWidth)
            .fixedSize()
        }
        .fixedSize(horizontal: false, vertical: true)
            .padding()
    }
}

#Preview {
    AirplaneProgressView()
}
