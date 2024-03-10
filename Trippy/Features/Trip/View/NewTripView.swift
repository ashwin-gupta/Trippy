//
//  NewTripView.swift
//  Trippy
//
//  Created by Ashwin Gupta on 10/3/2024.
//

import SwiftUI

struct NewTripView: View {
    
    @State var location: String
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var flights: [Flight]?
    @State var isFlightPopUpActive: Bool = false
    @State var isPersonPopUpActive: Bool = false
    
    @EnvironmentObject var viewModel: TripViewModel
    
    var body: some View {
        
        ZStack {

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    
                    SectionHeader(title: "Trip Overview")
                    
                    InputView(text: $location, title: nil, placeholder: "Trip name?")
                    
                    VStack {
                        DatePicker("Start Date", selection: $startDate, displayedComponents: [.date])
                        DatePicker("End Date", selection: $endDate, displayedComponents: [.date])
                    }.padding(.vertical)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        HStack {

                            SectionHeader(title: "Flights")
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .onTapGesture {
                                    isFlightPopUpActive = true
                                }.foregroundColor(.inverse)
                        }
                        
                        if let flights = flights {
                            ForEach(flights, id: \.self) { flight in
                                FlightTile(flightInfo: flight)
                            }
                        } else {
                            FlightTile()
                        }
                    }
                    Divider()
                    
                    HStack {

                        SectionHeader(title: "People")
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .onTapGesture {
                                isPersonPopUpActive = true
                            }.foregroundColor(.inverse)
                    }
                    PersonSection()
                    
                    Divider()
                    
                    HStack {

                        SectionHeader(title: "Lists")
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .onTapGesture {
                                isPersonPopUpActive = true
                            }.foregroundColor(.inverse)
                    }
                    
                    Divider()
                
                    SectionHeader(title: "Notes")
                    
                }.padding(.horizontal)
 
            }
            
            
     
            if isFlightPopUpActive {
                AddFlightView(isActive: $isFlightPopUpActive)
            }
            
            if isPersonPopUpActive {
                AddPersonView(isActive: $isPersonPopUpActive)
            }
            
        }
    }
}

struct FlightTile: View {
    
    var flightInfo: Flight?
    
    var body: some View {
        
        if flightInfo != nil {
            VStack {
                HStack {
                    Text("Flight Number")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text("Date")
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "airplane.departure")
                    Text("11:10")
                    Spacer()
                    Image(systemName: "airplane.arrival")
                    Text("07:00")
                    
                }
            }   .padding()
                .background(Constants.UI.background)
                .cornerRadius(Constants.UI.cornerRadius)
        } else {
            Text("Click + to add a flight")
                
                .fontWeight(.bold)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(Constants.UI.background)
                .cornerRadius(Constants.UI.cornerRadius)
            
        }


    }
}

struct PersonSection: View {
    @State private var containerWidth: CGFloat = 0
    @State private var people: [Person] = [
        Person(name: "You", expenses: nil, totalSpent: nil, color: Color.black, email: nil),
        Person(name: "Ankita", expenses: nil, totalSpent: nil, color: Color.blue, email: nil)
    ]
    
    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {

        LazyVGrid(columns: adaptiveColumn, spacing: 16) {
            
            ForEach(people, id: \.name) { person in
                Text(person.name)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(person.color)
                    .foregroundColor(.white)
                    .cornerRadius(Constants.UI.cornerRadius)

                
            }
            
        }
    }
}

struct SectionHeader: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 24))
            .fontWeight(.bold)
        
    }
}

#Preview {
    
    NewTripView(location: "Japan")
}
