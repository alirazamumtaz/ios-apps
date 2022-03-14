//
//  PageView.swift
//  Gathowan-Wheel-App
//
//  Created by Ali Raza on 10/03/2022.
//

import SwiftUI

struct WheelPart: View {
    let imageName: String
    var body: some View{
        Image(imageName)
            .resizable()
            .scaledToFit()
            .cornerRadius(16)
            .frame(width: UIScreen.main.bounds.width-100, height: UIScreen.main.bounds.width/2.7)
    }
}

struct PageView: View {
    let borderColor: Color
    @Binding var selectedFrame: Int
    static var outterInFrameformation = ["Vehicle Type",
                                              "Width of Tire",
                                              "Aspect Ratio of Tire",
                                              "Construction of Belt",
                                              "Rim Diameter",
                                              "Load Index",
                                              "Speed Rating",
                                              "Trade wear Indicator",
                                              "Friction Index",
                                              "Heat Resistance",
                                              "Name of the Tire" ]
                                             
    static var innerFrameInformation  = ["Maximum Load","Maximum Presure","Serial Number & Date"]
    
    // This is the description of outterFrameFormation
    static let description = [
        [
            "P Passenger car tires",
            "LT tires for light trucks",
            "C Tires for large commercial trucks"
        ],

        [
            "Heat resistance refers to"
        ],

        [
            "The is the width of the frame."
        ],

        [
            "The ratio of the frame's height to its width."
        ],

        [
            "R frame with layers of steel belts.",
            "B frame with layers of fabric belts."
        ],

        [
            "It means the size of the wheel or the girth It is a number and is measured in inches."
        ],

        [
            "89 load 580 kg.",
            "90 load 600 kg.",
            "91 load 615 kg",
            "92 load 630 kg",
            "93 load 650 kg",
            "94 load 670 kg"
        ],

        [
            "J has a top speed of 100 km/h.",
            "K has a top speed of 110 km/h.",
            "L has a top speed of 120 km/h.",
            "M has a top speed of 130 km/h.",
            "W has a top speed of 140 km/h.",
            "P has a top speed of 150 km/h.",
            "Q has a top speed of 160 km/h.",
            "R has a top speed of 170 km/h.",
            "S has a top speed of 180 km/h.",
            "T has a top speed of 190 km/h.",
            "H has a top speed of 210 km/h.",
            "Vr has a top speed of 210 km/h.",
            "Zr has a top speed of 240 km/h.",
            "V has a top speed of 240 km/h.",
            "W has a top speed of 270 km/h.",
            "Y Open more than 270 km/h."
        ],

        [
            "It shows how the frame corrosion resistant. The higher the figure increased frame corrosion resistant The tire tread wear index is 220. It amounts to the erosion of the tread 300 index and more."
        ],

        [
            "The friction index is a measure of tire capacity. To stand on wet surfaces or sidewalks. It is indicated by the letters C, B, A, AA. The greatest rate of friction is denoted by the symbol AA. The lowest friction symbol C."
        ],

        [
            "The ability of frame to get rid of heat. They are indicated by the letters A, B, or C. The highest heat tolerance is A and the lowest is C"
        ],
        
        [
            "The Name of the Tire."
        ]
    ]
    
    let frame: [String]
    var body: some View {
        TabView {
            ForEach(0..<frame.count) { i in
                ZStack {
                    Color.gray.opacity(0.2)
                        .cornerRadius(16)
                    WheelPart(imageName: frame[i])
                        .onAppear {
                            selectedFrame = i
                        }
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(borderColor, lineWidth: 5)
            )
            .padding(.horizontal,250)
            .background(Color(UIColor.systemBackground))
        }
        .background(Color.white)
        
        .tabViewStyle(PageTabViewStyle())
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/2.5)
    }
}
