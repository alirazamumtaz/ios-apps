//
//  ContentView.swift
//  firstApp
//
//  Created by Ali Raza on 26/08/2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack{
            ZStack{
                Image("toronto")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .blur(radius: 0.2)
                    .cornerRadius(10)




                VStack(alignment: .center, spacing:10){
                    Text("CN Tower")
                        .font(.largeTitle)
                        .padding([.top,.leading,.trailing])


                    Text("Toronto")
                        .font(.caption)
                        .padding([.leading,.bottom,.trailing])
                }
                .background(Color.black)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .cornerRadius(10.0)
                .border(Color.blue)
            }.padding()
            ZStack{
                Image("london")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .blur(radius: 0.2)
                    .cornerRadius(10)




                VStack(alignment: .center, spacing:10){
                    Text("Big Ben")
                        .font(.largeTitle)
                        .padding([.top,.leading,.trailing])


                    Text("London")
                        .font(.caption)
                        .padding([.leading,.bottom,.trailing])
                }
                .background(Color.black)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .cornerRadius(10.0)
                .border(Color.blue)
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
