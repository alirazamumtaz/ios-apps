//
//  Alerts.swift
//  TicTacToe
//
//  Created by Ali Raza on 02/10/2021.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var busttonTitle: Text
}
struct AlertContext {
    static let humanWin = AlertItem(title: Text("You Win"),
                             message: Text("Very Nice Bud!!!"),
                             busttonTitle: Text("Play Again"))
    static let computerWin = AlertItem(title: Text("You Lost"),
                             message: Text("Nice try!!!"),
                             busttonTitle: Text("Rematch"))
    static let draw = AlertItem(title: Text("Draw"),
                             message: Text("Nice battle!!!"),
                             busttonTitle: Text("Try Again"))
}
