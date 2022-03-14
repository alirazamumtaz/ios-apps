//
//  HomeView.swift
//  wheel-information
//
//  Created by Ali Raza on 28/02/2022.
//

import SwiftUI

struct DateView: View {
    @State private var a: Int = 0
    @State private var b: Int = 8
    @State private var c: String = "1"
    @State private var d: String = "2"
    @EnvironmentObject private var menuService : MenuService
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
                .navigationTitle("Date View")
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
                    
                    // This position is for add.
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(UIColor.systemBackground))
                            
                        VStack{
                            Spacer()
                            Text("Check the Date of Manufacture")
                                .font(.title)
                            Image("determine-age-of-tires")
                                .renderingMode(.original)
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200.0, height: 150.0)
                            Spacer()
                            Text("Enter the Date")
                                .modifier(CustomHeading())
                            HStack(alignment: .center, spacing:20) {
                                TextField(" ", value: $a, formatter: NumberFormatter())
                                    .modifier(CustomInputDesgin())
                                TextField("", value: $b, formatter: NumberFormatter())
                                    .modifier(CustomInputDesgin())
                                TextField("0", text: $c)
                                    .modifier(CustomInputDesgin())
                                TextField("0", text: $d)
                                    .modifier(CustomInputDesgin())
                            }
    //                        .padding(.horizontal, 100.0)
                            // HStack
                            Spacer()
                            Text("The frame was made in History")
                                .modifier(CustomHeading())
                            
                            Text(calCulateDate((10*a)+b) + " / 20" + "\(c)\(d)")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .padding(.all)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.orange))
                            Spacer()
                            
                            
                        }// VStack
                    }
                    .offset(y: 20)// ZStack
                }
        }

    }
}

func calCulateDate(_ a: Int) -> String {
    var str = ""
    let day = (a*7)/30
    str = String(day)
    return str
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
            .previewLayout(.sizeThatFits)
    }
}
