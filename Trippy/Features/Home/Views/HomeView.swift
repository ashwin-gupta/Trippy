//
//  HomeView.swift
//  Trippy
//
//  Created by Ashwin Gupta on 27/2/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = AuthViewModel()

    @StateObject var tripViewModel = TripViewModel()
    var body: some View {
        if viewModel.userSession != nil {
            ContentView()
                .environmentObject(tripViewModel)
        } else {
            LoginView()
        }
    }
}

#Preview {
    HomeView()
}
