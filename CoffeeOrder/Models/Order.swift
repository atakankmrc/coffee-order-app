//
//  Order.swift
//  CoffeeOrder
//
//  Created by Atakan Kömürcü on 4.06.2022.
//

import Foundation

struct Order: Codable {
    
    let name: String
    let coffeeName: String
    let size: String
    let total: Double
    
}

