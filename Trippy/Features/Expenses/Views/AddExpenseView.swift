//
//  AddExpenseView.swift
//  Trippy
//
//  Created by Ashwin Gupta on 25/2/2024.
//

import SwiftUI



struct AddExpenseView: View {
    
    @State var title: String
    @State var cost: String
    
    var body: some View {
        NavigationView {
            
            VStack {
//                TextInputField(text: $title, placeholder: "Expense title")
//                TextInputField(text: $cost, placeholder: "cost").keyboardType(.decimalPad)
//
                
                
            }.navigationBarTitle("Add Expense")
        }
        
    }
}



#Preview {
    AddExpenseView(title: "", cost: "")
}
