//
//  ContentView.swift
//  Unit Convertor
//
//  Created by Ali Raza on 08/09/2021.
//

import SwiftUI

struct ContentView: View {
    // Properties
    let Units = ["Meters", "Km", "Feet", "Yard", "Miles"]
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    @State private var inputValue = "0.0"
    
    
    func coverToMeter(inputUnitValue: Double) -> Double {
        switch inputUnit {
            case 1:
                return inputUnitValue*1000
            case 2:
                return inputUnitValue/3.281
            case 3:
                return inputUnitValue/1.094
            case 4:
                return inputUnitValue*1609
            default:
                return inputUnitValue
        }
    }
    
    var result: String {
        let doubleInputValue = Double(inputValue) ?? 0.0
        let valueInMeter = coverToMeter(inputUnitValue: doubleInputValue)
        switch outputUnit {
        case 1:
            return String(valueInMeter/1000)
        case 2:
            return String(valueInMeter*3.281)
        case 3:
            return String(valueInMeter*1.094)
        case 4:
            return String(valueInMeter/1609)
        default:
            return String(valueInMeter)
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Input Value")){
                    TextField("Enter Value", text: $inputValue)
                }
                Section(header: Text("Select input Unit")){
                    Picker(selection:$inputUnit, label: EmptyView()) {
                        ForEach(0 ..< Units.count){
                            Text("\(self.Units[$0])")
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Select Output Unit")){
                    Picker(selection: $outputUnit, label: EmptyView()) {
                        ForEach(0 ..< Units.count) {
                            Text("\(self.Units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Result")){
                    if Double(inputValue) == nil{
                        Text("Invalid Input")
                    }
                    else {
                        Text("\(result)")
                    }
                }
            }
            .navigationBarTitle(Text("Unit Conversion"), displayMode: .inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
