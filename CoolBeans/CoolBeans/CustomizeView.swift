//
//  CustomizeView.swift
//  CoolBeans
//
//  Created by Ali Raza on 28/12/2021.
//

import SwiftUI

struct CustomizeView: View {
    let drink: Drink
    
    @EnvironmentObject var menu: Menu
    
    
    @State private var size = 0
    @State private var isDecaf = false
    @State private var extraShots = 0
    @State private var milk = ConfigurationOption.none
    @State private var syrup = ConfigurationOption.none
    
    let sizeOption = ["Small", "Medium", "Large"]
    
    var caffeine: Int {
        var caffeineAmount = drink.caffeine[size]
        caffeineAmount += (extraShots * 60) // here 60 is in my prepception. not real numbers
        if isDecaf {
            caffeineAmount /= 20 // again not real
        }
        
        return caffeineAmount
    }
    
    var calories: Int {
        var caloriesAmounts = drink.baseCalories
        caloriesAmounts += (extraShots * 10)
        if drink.coffeeBased {
            caloriesAmounts += milk.calories
        } else {
            caloriesAmounts += (milk.calories / 8)
        }
        return caloriesAmounts
    }
    var body: some View {
        Form {
            Section("Basic Options") {
                Picker("Size", selection: $size) {
                    ForEach(sizeOption.indices) { index in
                        Text(sizeOption[index])
                    }
                }.pickerStyle(.segmented)
                
                if drink.coffeeBased {
                    Stepper("Extra Shots: \(extraShots)", value: $extraShots, in: 0...8)
                }
                
                Toggle("Decaffenated", isOn: $isDecaf)
                
                Section ("Customization"){
                    Picker("Milk", selection: $milk) {
                        ForEach(menu.milkOptions) { option in
                            Text(option.name)
                                .tag(option)
                        }
                    }
                }
                
                if drink.coffeeBased {
                    Picker("Syrup", selection: $syrup) {
                        ForEach(menu.syrupOptions) { option in
                            Text(option.name)
                                .tag(option)
                        }
                    }
                }
                
                Section("Estimate") {
                    Text("**Caffeine:** \(caffeine)mg")
                    Text("**Calories:** \(calories)")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(drink.name)
        }
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView(drink: Drink.example)
            .environmentObject(Menu())
    }
}
