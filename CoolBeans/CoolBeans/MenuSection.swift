//
//  MenuSection.swift
//  CoolBeans
//
//  Created by Ali Raza on 28/12/2021.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [Drink]
    
    
}
