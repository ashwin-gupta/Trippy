//
//  Trip.swift
//  Trippy
//
//  Created by Ashwin Gupta on 10/3/2024.
//

import Foundation

struct Trip {
    let id: String
    let userId: String
    let name: String
    let dateStart: Date
    let dateEnd: Date
    let flights: [Flight]
    let description: String
    
}
