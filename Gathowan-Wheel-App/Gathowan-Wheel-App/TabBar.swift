//
//  TabBar.swift
//  wheel-information
//
//  Created by Ali Raza on 28/02/2022.
//

import SwiftUI

struct TabBar: View {
    @Binding  var currentTab : String
    var body: some View {
        HStack {
            
            customButton(title: "date", icon: "date")
            Spacer()
            customButton(title: "wheel", icon: "wheel")
            Spacer()
            customButton(title: "info", icon: "info")
            
        }
        .padding(.horizontal, 20)
        .frame(height: 45)
        
        
        
        
    }
    
    // custom button
    @ViewBuilder
    func customButton(title: String, icon: String) -> some View {
        Button {
            withAnimation {
                currentTab = title
            }
        } label: {
            HStack (spacing: 15) {
                Text(title)
                    .foregroundColor(.primary)
                    .frame(width : currentTab == title ? 50 : 0)
                
                Image(icon)
                    .renderingMode(.template)
                    .imageScale(.large)
                    .foregroundColor(currentTab == title ? .primary : .secondary)
            }
            .padding(10)
            .background(
                ZStack{
                    if title == currentTab{
                        Color.red.clipShape(Capsule())
                            .shadow(color: .black, radius: 2, x: 1, y: 1)
                    }
                }
            )
            
            
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
