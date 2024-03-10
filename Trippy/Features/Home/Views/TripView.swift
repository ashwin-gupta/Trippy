//
//  TripView.swift
//  Trippy
//
//  Created by Ashwin Gupta on 27/2/2024.
//

import SwiftUI

struct TripView: View {
    

    var body: some View {
        
        VStack {
            Header()
            TripCard()
            Spacer()
        }
    }
}

struct Header: View {
    @State var date = Date()
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.backward").onTapGesture {
                date = Calendar.current.date(byAdding: .day, value: -1, to: date)!
            }
            Spacer()
            Text(date.formatted(date: .complete, time: .omitted)).fontWeight(.semibold)
            Spacer()
            Image(systemName: "arrow.forward").onTapGesture {
                date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
            }
        }.padding()
        AirplaneProgressView()
    }
}

struct TripCard: View {
    
    
    @EnvironmentObject var viewModel: TripViewModel
    
    var body: some View {
        ScrollView {
            NavigationStack {
                ItinieraryView()
            }
            ItinieraryView()

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(UIColor(white: 0.8, alpha: 0.3)))
        .cornerRadius(16)
        .padding(.horizontal)
        
    }
}

struct ItinieraryView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Today")
                .font(.system(size: 32))
                .fontWeight(.semibold)
                .padding(.bottom, 8)
            Text("☀️ Morning").font(.system(size:24)).fontWeight(.semibold)
            ItinieraryTile()
                .padding(.bottom)
            
            Text("🌤️ Afternoon").font(.system(size:24)).fontWeight(.semibold)
            ItinieraryTile()
                .padding(.bottom)
            Text("🌙 Evening").font(.system(size:24)).fontWeight(.semibold)
            ItinieraryTile()
            
            NavigationStack {
                NavigationLink {
                    
                    NewTripView(location: "Japan")

                } label: {
                    Text("Create new trip here")
                }
            }

        }
    }
    
}

struct ItinieraryTile: View {
    var body: some View {
        
        VStack() {
            HStack {
                Circle().frame(width: 8, height: 8)
                Text("Item number 1")
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .frame(maxHeight: .infinity)
    }
}

#Preview {
    TripView()
}
