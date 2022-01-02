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
    @EnvironmentObject var history: History
    
    let dismiss:  () -> Void
    
    @State private var size = 0
    @State private var isDecaf = false
    @State private var extraShots = 0
    @State private var milk = ConfigurationOption.none
    @State private var syrup = ConfigurationOption.none
    @State private var isFirstAppearance = true
    
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
        var caloriesAmount = drink.baseCalories
        caloriesAmount += (extraShots * 10)
        if drink.coffeeBased {
            caloriesAmount += milk.calories // because if it has most of milk calories
        } else {
            caloriesAmount += (milk.calories / 8) // team is have low milk thats why divided by 100
        }
        caloriesAmount += syrup.calories
        return caloriesAmount * (size + 1)
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
        }
            Section ("Customization"){
                Picker("Milk", selection: $milk) {
                    ForEach(menu.milkOptions) { option in
                        Text(option.name)
                            .tag(option)
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
                
            }
            
            Section("Estimate") {
                Text("**Caffeine:** \(caffeine)mg")
                Text("**Calories:** \(calories)")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(drink.name)
        .toolbar {
            Button("Save") {
                history.add(drink, size: sizeOption[0], extraShots: extraShots, isDecaf: isDecaf, milk: milk, syrup: syrup, coffeine: caffeine, calories: calories)
                
                dismiss()  //dismiss the view
            }
        }
        .onAppear {
            guard isFirstAppearance else { return }
            if drink.servedWithMilk {
                milk = menu.milkOptions[1]
            }
            
            isFirstAppearance = false
        }
    }
}

struct CustomizeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeView(drink: Drink.example) { }
            .environmentObject(Menu())
    }
}
