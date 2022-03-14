//
//  ContentView.swift
//  Gathowan-Wheel-App
//
//  Created by Ali Raza on 28/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var menuService = MenuService()
    @State private var selectedTab = "info"
    
    init (){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack {
            TabView (selection: $selectedTab){
                NavigationView {
                    DateView()
                        .ignoresSafeArea(.keyboard)
                }
                .tag("date")
                
                NavigationView {
                    
                    InfoView()
                        .ignoresSafeArea(.keyboard)
                }
                .tag("wheel")
                
                NavigationView {
                    WheelView()
                        .ignoresSafeArea(.keyboard)
                }
                .tag("info")
            }
            
            Divider()
            
            TabBar(currentTab: $selectedTab)
                .padding(.bottom)
        }
        .ignoresSafeArea(.keyboard)
        .environmentObject(menuService)
        .slideInView(isActive: $menuService.isPresented, edge: .trailing, paddingPercentage: 0.25) {
            SideMenu().environmentObject(menuService)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
