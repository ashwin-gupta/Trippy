//
//  AddExpenseViewModel.swift
//  Trippy
//
//  Created by Ashwin Gupta on 27/2/2024.
//

import Foundation
import FirebaseFirestore

extension AddExpenseView {
    @Observable
    class ViewModel {
        
        let db = Firestore.firestore()
        
        
        func addExpense(expense: Expense) {
            db.collection(Constants.ExpenseDB.collectionName)
        }
        
    }
}


