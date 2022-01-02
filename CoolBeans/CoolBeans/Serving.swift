//
//  Serving.swift
//  CoolBeans
//
//  Created by Ali Raza on 02/01/2022.
//

import Foundation

struct Serving: Identifiable, Codable, Equatable {
    var id: UUID
    let name: String
    let description: String
    let coffeine: Int
    let calories: Int
}
