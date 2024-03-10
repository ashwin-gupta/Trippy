//
//  TripViewModel.swift
//  Trippy
//
//  Created by Ashwin Gupta on 10/3/2024.
//

import Foundation

@MainActor
class TripViewModel: ObservableObject {
    
    @Published var trip: Trip? = nil
    @Published var flights: [Flight]? = []
    
    init(trip: Trip? = nil, flights: [Flight]? = nil) {
        self.trip = trip
        self.flights = flights
    }
    
    func addFlight(flight: Flight) {
        flights?.append(flight)
        print(flights)
    }
    
    func createTrip(named name: String, startDate: Date, endDate: Date, flights: [Flight], description: String) async {
        
    }
    
    func fetchTrip() async -> Trip? {
        return nil
    }
}
