//
//  GameMenu.swift
//  TicTacToe
//
//  Created by Ali Raza on 03/10/2021.
//

import SwiftUI

struct GameMenu: View {
    var body: some View{
        ZStack{
            MenuBackground(imageName: "menubackground")
            Text("Start")
            
        }
    }
}

struct MenuBackground: View{
    let imageName: String
    var body: some View{
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFill()
            .ignoresSafeArea()
            .opacity(0.5)
    }
}

struct GameMenu_Previews: PreviewProvider {
    static var previews: some View {
        GameMenu()
//            .previewLayout(.sizeThatFits)
//            .padding()
    }
}
