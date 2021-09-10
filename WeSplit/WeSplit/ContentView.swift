//
//  ContentView.swift
//  WeSplit
//
//  Created by Ali Raza on 07/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var totalAmount = ""
    @State private var noOfPeople = 2
    @State private var tip = 2
    
    let tipPercentage = [5, 10, 15, 20, 0]
    
    var amountPerPerson: Double {
        let totalPrice = Double(totalAmount) ?? 0.0
        let peopleCount = Double(noOfPeople)
        let tipValue = Double(tipPercentage[tip])
        
        return ((totalPrice+tipValue)/peopleCount)
        
    }
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Enter total Amount", text: $totalAmount)
                        .keyboardType(.numberPad)
                    
                    Picker("Number of People", selection: $noOfPeople){
                        ForEach(0..<20){
                            Text("\($0) People")
                        }
                    }
                }
                
                Section (header: Text("How much tip you want to leave?")){
                    Picker("Tip percentage", selection: $tip) {
                        ForEach(0 ..< tipPercentage.count) {
                            Text("\(self.tipPercentage[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount per Head")){
                    Text("Rs. \(amountPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle(Text("WeSplit"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
