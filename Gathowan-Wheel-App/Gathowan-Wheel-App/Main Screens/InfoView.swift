//
//  InfoView.swift
//  wheel-information
//
//  Created by Ali Raza on 28/02/2022.
//

import SwiftUI

let color = [Color.red, Color.green, Color.orange, Color.gray, Color.blue, Color.mint, Color.black]

struct InfoView: View {
    @EnvironmentObject private var menuService : MenuService
    @State private var type = [["P", "LT", "C"],
                               ["Tires for Light Trucks","Tires for Passenger Car","Tires for Large Commercial Trucks"]]
    @State private var belt = [["R", "B"],      ["Steel","Fabric"]]
    @State private var load = [["89", "90", "91", "92", "93", "94"],["580","600","615","630","650","670"]]
    @State private var speed = [["J", "K", "L", "M", "W", "P", "Q", "R", "S", "T", "H", "Vr", "Zr", "V", "Y"],
                                ["100","110","120","130","140","150","160","170","180","190","210","210","240","240","270+"]]
    
    
    @State private var choices = [0,215,65,0,15,1,10] // These are some default values
    
    
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
                .navigationTitle("Info View")
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
                    
                    // This Space is for add.
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(UIColor.systemBackground))
                        
                        VStack{
                            Spacer()
                            Image("dummy-wheel")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width - 50, height: 100, alignment: .center)
                                .cornerRadius(7.0)
                            Text("Enter Your Frame Information")
                                .font(.title)
                            HStack(alignment: .center) {
                                Spacer()
                                // <<<<< 1 >>>>>
                                Picker("Select Tire Type", selection: $choices[0]) {
                                    ForEach(type[0].indices, id: \.self) { i in
                                        Text("\(type[0][i])").tag(i)
                                    }
                                }
                                .modifier(CustomPickerStyle())
                                // <<<<< 2 >>>>>
                                TextField("Width of the Frame", value: $choices[1], formatter: NumberFormatter())
                                    .modifier(CustomTextFiledModifire())
                                // <<<<< 3 >>>>>
                                TextField("Height of the Tire", value: $choices[2], formatter: NumberFormatter())
                                    .modifier(CustomTextFiledModifire())
                                // <<<<< 4 >>>>>
                                Picker("Select Belt", selection: $choices[3]) {
                                    ForEach(belt[0].indices, id: \.self) { i in
                                        Text("\(belt[0][i])").tag(i)
                                    }
                                }
                                .modifier(CustomPickerStyle())
                                // <<<<< 5 >>>>>
                                TextField("Wheel Size", value: $choices[4], formatter: NumberFormatter())
                                    .modifier(CustomTextFiledModifire())
                                // <<<<< 6 >>>>>
                                Picker("Select Load", selection: $choices[5]) {
                                    ForEach(load[0].indices, id: \.self) { i in
                                        Text("\(load[0][i])").tag(i)
                                    }
                                }
                                .modifier(CustomPickerStyle())
                                // <<<<< 7 >>>>>
                                Picker("Select Speed Mark", selection: $choices[6]) {
                                    ForEach(speed[0].indices, id: \.self) { i in
                                        Text("\(speed[0][i])")
                                    }
                                }
                                .modifier(CustomPickerStyle())
                                Spacer()
                            }
                            Spacer()
                            Result(type, belt, load, speed, choices)
                            Spacer()
                            
                        }
                    }
                    .offset(y: 20)
                    
                    
                } // VStack
//                .frame(alignment:.bottom)
        } // ZStack
    } // body
} // struct

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .previewLayout(.sizeThatFits)
    }
}


// Result Stuctrue to show the result of a specified input.
func Result(_ type: [[String]], _ belt: [[String]],_ load: [[String]],_ speed: [[String]],_ choices: [Int]) -> some View {
    return VStack(spacing: 20) {
        // <<<<< 1 >>>>
        HStack {
            Spacer()
            Text("\(type[1][choices[0]])")
                .modifier(CustomOptionDescription())
            Text("\(type[0][choices[0]])")
                .modifier(CustomOption(colorIdx: 0))
            Spacer()
        } //HStack
        // <<<<< 2 >>>>>
        HStack {
            Spacer()
            Text("Frame width \(choices[1]) mm  " + String(format: "%.2f", (Double(choices[1])/10.0)) + " cm")
                .modifier(CustomOptionDescription())
            Text("\(choices[1])")
                .modifier(CustomOption(colorIdx: 1))
            Spacer()
        } //HStack
        // <<<<< 3 >>>>>
        HStack {
            Spacer()
            Text("Height of the Tire is \(getHeight(Double(choices[1]),Double(choices[2]))) mm")
                .modifier(CustomOptionDescription())
            Text("\(choices[2])")
                .modifier(CustomOption(colorIdx: 2))
            Spacer()
        } //HStack
        // <<<<< 4 >>>>>
        HStack {
            Spacer()
            Text("Layers with \(belt[1][choices[3]]) Belts.")
                .modifier(CustomOptionDescription())
            Text("\(belt[0][choices[3]])")
                .modifier(CustomOption(colorIdx: 3))
            Spacer()
        } //HStack
        // <<<<< 5 >>>>>
        HStack {
            Spacer()
            Text("Your Wheen Size")
                .modifier(CustomOptionDescription())
            Text("\(choices[4])")
                .modifier(CustomOption(colorIdx: 4))
            Spacer()
        } //HStack
        // <<<<< 6 >>>>>
        HStack {
            Spacer()
            Text("Maxmimum Tyre Load is \(load[1][choices[5]])kg")
                .modifier(CustomOptionDescription())
            Text("\(load[0][choices[5]])")
                .modifier(CustomOption(colorIdx: 5))
            Spacer()
        } //HStack
        // <<<<< 7 >>>>>
        HStack {
            Spacer()
            Text("Max Speed is \(speed[1][choices[6]])")
                .modifier(CustomOptionDescription())
            Text("\(speed[0][choices[6]])")
                .modifier(CustomOption(colorIdx: 6))
            Spacer()
        } //HStack
        
    } // VStacck
}

// This function is just calculationg the height of tire and returng in the form of String
func getHeight(_ width: Double, _ percentage: Double) -> String{
    
    return String(format: "%.2f", percentage/100.0 * width )
}
