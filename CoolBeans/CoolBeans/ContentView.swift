//
//  ContentView.swift
//  CoolBeans
//
//  Created by Ali Raza on 28/12/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()
    @StateObject var histroy = History()
    @State private var showingAddScreen = false
    var totalCaffeine: Int {
        histroy.servings.map(\.coffeine).reduce(0, +)
    }
    
    var totalCalories: Int {
        histroy.servings.map(\.calories).reduce(0, +)
    }
    var body: some View {
        NavigationView {
            List {
                if histroy.servings.isEmpty {
                    Button("Add your first drink") {
                        showingAddScreen = true
                    }
                } else {
                    Section("Summary") {
                        Text("Calories: \(totalCalories)mg")
                        Text("Caffeine: \(totalCaffeine)mg")
                    }
                    
                    ForEach (histroy.servings) { serving in
                        HStack {
                            VStack (alignment: .leading) {
                                Text(serving.name)
                                    .font(.headline)
                                Text(serving.description)
                                    .font(.caption)
                            }
                            Spacer()
                            
                            Text ("\(serving.coffeine)mg")
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    histroy.delete(serving)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                            Button {
                                withAnimation {
                                    histroy.reorder(serving)
                                }
                            } label: {
                                    Label("Delete", systemImage: "repeat")
                            }
                            .tint(.blue)
                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen, content: MenuView.init)
            .navigationTitle("Cool Beans")
            .toolbar {
                Button {
                    showingAddScreen = true
                } label: {
                    Label("Add new Drink", systemImage: "plus")
                }
            }
        }
            .environmentObject(menu)
            .environmentObject(histroy)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
