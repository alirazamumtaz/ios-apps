//
//  GameMenu.swift
//  TicTacToe
//
//  Created by Ali Raza on 03/10/2021.
//

import SwiftUI

struct GameMenu: View {
    @State private var sSymbol = "oSign"
    @State private var oSymbol = "xSign"
    
    
    var body: some View{
        NavigationView{
            ZStack{
                MenuBackground(imageName: "menubackground")
                VStack {
                    
                    HStack{
                        Image("oSign")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .background(
                                Color.red.opacity(sSymbol == "oSign" ? 1 : 0).cornerRadius(12)
                                    .frame(maxHeight: 8)
                                    .offset(y: 45)
                            )
                            .scaleEffect(sSymbol == "oSign" ? 1.15 : 1)
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.2)) {
                                    sSymbol = "oSign"
                                    oSymbol = "xSign"
                                    
                                    humanSymbol = sSymbol
                                    computerSymbol = oSymbol
                                }
                            }
                        
                        Image("xSign")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .background(
                                Color.green.opacity(sSymbol == "xSign" ? 1 : 0).cornerRadius(12)
                                    .frame(maxHeight: 8)
                                    .offset(y: 45)
                            )
                            .scaleEffect(sSymbol == "xSign" ? 1.15 : 1)
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.2)) {
                                    sSymbol = "xSign"
                                    oSymbol = "oSign"
                                    
                                    humanSymbol = sSymbol
                                    computerSymbol = oSymbol
                                }
                            }
                    }
                    .padding(.bottom, 30)
                    
                    NavigationLink(destination: GameView()) {
                        ZStack {
                            Text("Start")
                                .font(.custom("Avenir-Heavy", size: 20))
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                                .padding(.leading, 16)
                                .padding(.trailing, 16)
                                .foregroundColor(.white)
                            
                        }
                    }
                    .background(
                        LinearGradient(
                            gradient: .init(colors: [Color.green,Color.blue,Color.blue.opacity(0.75)]),
                                startPoint: .init(x: -0.33, y: -0.33),
                                endPoint: .init(x: 0.66, y: 0.66)
                            )
                        .mask(
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: 120, height: 45, alignment: .center)
                                .blur(radius: 5)
                        )
                        
                    )
                }
            }
            .navigationTitle("Main Menu")
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
