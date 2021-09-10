//
//  ContentView.swift
//  warCard
//
//  Created by Ali Raza on 26/08/2021.
//

import SwiftUI

struct ContentView: View {
    // Properties
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var playerCard = "card" + String(Int.random(in: 2...14))
    @State var cpuCard = "card" + String(Int.random(in: 2...14))
    
    var body: some View {
        
        ZStack{
            Image("background")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    let randPlayerCard = Int.random(in: 2...14)
                    let RandCpuCard = Int.random(in: 2...14)
                    
                    playerCard = "card" + String(randPlayerCard)
                    cpuCard = "card" + String(RandCpuCard)
                    
                    if RandCpuCard > randPlayerCard {
                        cpuScore += 1
                    }
                    else if RandCpuCard < randPlayerCard {
                        playerScore += 1
                    }
                    
                }, label: {
                    Image("dealbutton")
                })
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text(String("CPU"))
                            .font(.headline)
                            .foregroundColor(Color.white)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
