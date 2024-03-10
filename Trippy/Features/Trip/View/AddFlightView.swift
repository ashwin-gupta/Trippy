//
//  AddFlightView.swift
//  Trippy
//
//  Created by Ashwin Gupta on 10/3/2024.
//

import SwiftUI

struct AddFlightView: View {
    @Binding var isActive: Bool
    @State private var flightNumber: String = ""
    @State private var departure = Date()
    @State private var arrival = Date()
    @State private var offset: CGFloat = 1000
    
    @EnvironmentObject var viewModel: TripViewModel
    
    
    var body: some View {
        ZStack {
            Color(.systemGray)
                .opacity(0.3)
                .onTapGesture {
                    close()
                }
            
            VStack {
                Text("Add Flight")
                    .font(.title2)
                    .bold()
                    .padding()
                
                VStack(spacing: 8) {
                    InputView(text: $flightNumber, title: nil, placeholder: "Flight Number (e.g. XYZ-123) ").padding(.bottom)
                    DatePicker("Departure", selection: $departure)
                    DatePicker("Arrival", selection: $arrival)
                }
                
                
                FillButton(text: "Add Flight", backgroundColour: .inverse, foregroundColour: .buttonTextColour, action: {
                    viewModel.addFlight(flight: Flight(flight: flightNumber, departure: departure, arrival: arrival))
                    close()
                }).padding()
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
            .padding(30)
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
    AddFlightView(isActive: .constant(true))
}
