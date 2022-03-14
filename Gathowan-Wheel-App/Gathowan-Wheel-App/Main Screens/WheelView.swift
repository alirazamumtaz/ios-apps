//
//  MainView.swift
//  wheel-information
//
//  Created by Ali Raza on 28/02/2022.
//

import SwiftUI

struct WheelView: View {
    @EnvironmentObject private var menuService : MenuService
    @State private var outterIndex = 0
    @State private var innerIndex = 0
    init() {
        
        let appearance = UINavigationBarAppearance()
        let textColor = UIColor(Color.white)
        appearance.titleTextAttributes = [
            .foregroundColor: textColor,
        ]
        appearance.backgroundColor = UIColor(Color.red)
        UINavigationBar.appearance().standardAppearance = appearance
        
    }
    
    var body: some View {
        // these are the assets name inner wheel description
        let innerParts:[String] = ["load_inner","pressure_inner","serialNumber_inner"]
        // these are the assets name outer wheel description
        let outerParts:[String] = [ "tireType_outter","frameWidth_outter","frameRatio_outter","belts_outter","wheelSize_outter","maxLoad_outter","spped_outter","treadwear_outter","friction_outter","temperature_outter","tireName_outter"]
        
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
                .navigationTitle("Wheel View")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        Button {
                            menuService.isPresented.toggle()
                        } label : {
                            Image(systemName: "sidebar.right")
                                .foregroundColor(.white)
                        }
                    }
                }
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(UIColor.systemBackground))
                    VStack {
                        Spacer()
                        // PageView A ScrollView that have all pictures of the frame.
                        PageView(borderColor:Color.red ,selectedFrame: $outterIndex, frame: outerParts )
                        Divider()
                        PageView(borderColor:Color.blue ,selectedFrame: $innerIndex, frame: innerParts)
                        Spacer()
                        
                        // Information about thr pictures
                        VStack {
                            Text(PageView.outterInFrameformation[outterIndex])
                                .font(.title3)
                                .frame(width: 310, height: 35, alignment: .center)
                                .background(RoundedRectangle(cornerRadius: 7.0).fill(Color(UIColor.systemBackground)).shadow(color: .gray, radius: 7, y: 2.0))
                                .border(Color.red)
                            // This is the description/information
                            ScrollView{
                                ForEach(PageView.description[outterIndex], id: \.self){ line in
                                    Text(line)
                                        .font(.caption)
                                        .frame(width: 280, height: 35, alignment: .center)
                                        .background(RoundedRectangle(cornerRadius: 7.0).fill(Color(UIColor.systemBackground)).shadow(color: .gray, radius: 7, y: 2.0))
                                        .border(Color.red).cornerRadius(3.0)
                                }
                                .padding()
                                .frame(alignment:.leading)
                            }.frame(height:80)
                        } //VStack
                        
                        // <<<<< 2 >>>>>
                        Text(PageView.innerFrameInformation[innerIndex])
                            .font(.title3)
                            .frame(width: 300, height: 35, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 7.0).fill(Color(UIColor.systemBackground)).shadow(color: .gray, radius: 7, y: 2.0))
                            .border(Color.blue)
                            .padding(.horizontal)
                        Spacer()
                    }
                } // ZStack
                .offset(y: 20)
            } // VStack
        }
    } // body
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        WheelView()
            .previewLayout(.sizeThatFits)
    }
}
