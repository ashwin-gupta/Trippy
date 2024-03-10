//
//  User.swift
//  Trippy
//
//  Created by Ashwin Gupta on 3/3/2024.
//

import Foundation

struct User: Identifiable, Codable {
    
    let id: String
    let fullName: String
    let email: String
    let trips: [String?]
}
