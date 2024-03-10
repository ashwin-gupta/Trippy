//
//  ContentView.swift
//  Trippy
//
//  Created by Ashwin Gupta on 25/2/2024.
//

import SwiftUI

struct ContentView: View, Hashable {
    
    var loggedIn: Bool = false
    
    var body: some View {
        TabView {
            TripView().tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            AddExpenseView(title: "", cost: "").tabItem {
                Label("Expense", systemImage: "dollarsign")
            }
            NewTripView(location: "Japan")
        }
        
    }
}

#Preview {
    ContentView()
}
