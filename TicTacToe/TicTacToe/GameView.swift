//
//  GameView.swift
//  TicTacToe
//
//  Created by Ali Raza on 01/10/2021.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                LazyVGrid(columns: viewModel.columns){
                    ForEach(0..<9) {index in
                        ZStack{
                            GameCirlceView(proxy: geometry)
                            PlayerIndicator(systemImageName: viewModel.moves[index]? .indicator ?? "")
                        } // :ZStack
                        .onTapGesture {
                            viewModel.processPlayerMove(for: index)
                            
                        } // :onTapGesture
                    }
                } // :LazyVGrid
                .background(Image("board").resizable())
                Spacer()
                VStack {
                    Button(action:{ viewModel.resetGame() }, label: {Image("resetButton").resizable().frame(width: 50, height: 50, alignment: .center).colorInvert().shadow(radius: /*@START_MENU_TOKEN@*/11/*@END_MENU_TOKEN@*/)})
                    Text("Rest")
                        .font(.caption)
                        .foregroundColor(Color.white)
                        
                }
                Spacer()
            } // :VStack
            .disabled(viewModel.isGameBoardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.busttonTitle, action: {viewModel.resetGame()}
                      )
                )
            })
            
        }// :GeometryReader
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.073, green: 0.231, blue: 0.313)/*@END_MENU_TOKEN@*/)
        .ignoresSafeArea()
        
    } // :body
}

enum Player{
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xSign" : "oSign"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

struct GameCirlceView: View {
    var proxy: GeometryProxy
    
    var body: some View{
        Rectangle()
            .foregroundColor(Color.secondary)
            .opacity(0.1)
            .frame(width: proxy.size.width/3-5, height: proxy.size.width/3-5)
    
    }
    
}

struct PlayerIndicator: View {
    var systemImageName: String
    
    var body: some View{
        Image(systemImageName)
            .renderingMode(.original)
            .resizable()
//            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100, alignment: .center)
    }
    
}

