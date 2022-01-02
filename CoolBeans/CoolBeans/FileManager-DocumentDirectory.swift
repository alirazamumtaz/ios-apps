//
//  FileManager-DocumentDirectory.swift
//  CoolBeans
//
//  Created by Ali Raza on 02/01/2022.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
