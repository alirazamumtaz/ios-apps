//
//  ConfigurationOption.swift
//  CoolBeans
//
//  Created by Ali Raza on 29/12/2021.
//

import Foundation

struct ConfigurationOption: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let calories: Int
    
    static let none = ConfigurationOption(id: UUID(), name: "none", calories: 0)
}
