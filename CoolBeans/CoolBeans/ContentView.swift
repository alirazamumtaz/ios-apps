//
//  ContentView.swift
//  CoolBeans
//
//  Created by Ali Raza on 28/12/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()
    
    
    var body: some View {
        MenuView()
            .environmentObject(menu)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
