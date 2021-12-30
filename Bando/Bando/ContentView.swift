//
//  ContentView.swift
//  Bando
//
//  Created by Ali Raza on 08/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State var str: String = ""
    
    
    var body: some View {
        ZStack(){
            Color("bg").ignoresSafeArea()
        
            VStack(alignment: .leading, spacing: 10){
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 70, alignment: .leading)
                    .padding(.top, -25)
                
                Text("Let's sign you in,")
                    .foregroundColor(.white)
                    .font(Font.custom("tt_norms_bold.otf", size: 30 ))
                    .padding(.top, -10)
                
                Text("Welcome Back you've been missed!")
                    .font(Font.custom("tt_norms_regular.otf", size: 15))
                    .foregroundColor(.white.opacity(0.65))
                    .padding(.bottom, 20)
                
                Text("Full name")
                    .font(Font.custom("Poppins-Medium.ttf", size: 15))
                    .foregroundColor(Color("fg"))
                    .padding(.top)

                
                TextField(text: $str, prompt: Text("Username or Email")) {
                        Text("Username")
                    }
                .frame(height: 50)
                .textFieldStyle(.plain)
                .overlay(RoundedRectangle(cornerRadius: 8).foregroundColor(.black))
                .overlay(
                    HStack {
                        Text("Username or Email")
                            .font(Font.custom("tt_norms_normal.otf", size: 14))
                            .foregroundColor(.white.opacity(0.65))
                            .padding(.leading)
                        Spacer()
                    }
                )
                
                
                Text("Enter Number")
                    .font(Font.custom("Poppins-Medium.ttf", size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("fg"))
                    .padding(.top)
                    
                
                TextField(text: $str, prompt: Text("Password")) {
                        Text("Password")
                }
                .frame(height: 50)
                .textFieldStyle(.plain)
                .overlay(RoundedRectangle(cornerRadius: 8).foregroundColor(.black))
                .overlay(
                    HStack {
                        Text("Password").foregroundColor(.white.opacity(0.65))
                            .font(Font.custom("tt_norms_normal.otf", size: 14))
                            .padding(.leading)
                        Spacer()
                    }
                )
                
            Spacer()
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text("Sign In")
                            .frame(width: 300, height: 70, alignment: .center)
                            .background(
                                Color("fg")
                            )
                            .foregroundColor(.black)
                    }
                    .cornerRadius(8)
                    .padding()
                    Spacer()
                }
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
