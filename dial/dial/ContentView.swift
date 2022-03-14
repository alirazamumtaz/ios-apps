//
//  ContentView.swift
//  dial
//
//  Created by Ali Raza on 01/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Dial(value: .constant(0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

