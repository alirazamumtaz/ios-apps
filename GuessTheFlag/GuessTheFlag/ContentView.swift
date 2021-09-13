//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Ali Raza on 10/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var flags = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    
    @State private var showingScore = false
    @State private var scoreValue = ""
    @State private var score = 0
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(  colors: [Color.blue, Color.primary, Color.blue]),
                                                startPoint: .top,
                                                endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30){
                Spacer()
                VStack{
                    Text("Tap the Flag of")
                        .font(.title)
                        .foregroundColor(Color.white)
                    Text(flags[correctAnswer])
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 3) { answer in
                    Button(action: {
                        self.flagTapped(answer:answer)
                        if scoreValue == "Correct"{
                            score += 1
                        }
                    },
                   label: {
                    Image(self.flags[answer])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule()
                            .stroke(Color.black, lineWidth: 2)
                            .shadow(color:.black, radius: 5)
                        )
                   })
                }
                Spacer()
            }
                
        }
        .alert(isPresented: $showingScore){
            Alert(title: Text(scoreValue),
                  message: Text("Your Score is " + String(score)),
                  dismissButton: .default(Text("Continue")){
                  self.askQuestion()
            })
        }
    }
    func flagTapped(answer: Int){
        if answer == correctAnswer{
            scoreValue = "Correct"
        } else {
            scoreValue = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        flags.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
