//
//  SideMenu.swift
//  wheel-information
//
//  Created by Ali Raza on 28/02/2022.
//

import SwiftUI

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

let options = [
    [  "Buy to Remove adds",
       "Refresh the Purchase",
       "Share the App",
       "Rate Us",
       "Other apps",
       "Twitter",
       "Contact Us"
    ],
    [
        "monetization",
        "refresh",
        "share",
        "star",
        "mobile",
        "twitter",
        "contactUs"
        
    ]
]
let links = [
            "https://apps.apple.com/us/app/tireinfo/id1613925900",
            "https://apps.apple.com/us/app/tireinfo/id1613925900",
            "https://apps.apple.com/us/app/tireinfo/id1613925900",
            "https://play.google.com/store/apps/dev?id=7372647745198897343",
            "https://play.google.com/store/apps/dev?id=7372647745198897343",
            "http://twitter.com/GAppsPhone",
            "http://www.gmail.com"
            ]
struct SideMenu: View {
    @EnvironmentObject private var menuService : MenuService
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button {
                    menuService.isPresented.toggle()
                } label : {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
                .padding(.trailing, 10)
            }
            
            HStack{
                VStack(alignment: .trailing) {
                    ZStack(){
                        Color.red
                            .cornerRadius(50, corners: [.bottomLeft])
                            .frame(height:300)
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 230, height: 230,alignment: .trailing)
                        
                    }
                    
                    ForEach(0..<7){ i in
                        Link(destination: URL(string: links[i])!) {
                            HStack{
                                Text(options[0][i])
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding()
                                Image(options[1][i])
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 30.0, height: 30.0)
                                
                            } // HStack
                        }
//                        Button {
//
//                            // Here you can place the links
//                            print(options[0][i])
//                        } label: {
//                            HStack{
//                                Text(options[0][i])
//                                    .font(.headline)
//                                    .foregroundColor(.black)
//                                    .padding()
//                                Image(options[1][i])
//                                    .resizable()
//                                    .foregroundColor(.black)
//                                    .frame(width: 30.0, height: 30.0)
//
//                            } // HStack
//                        } // Button Lable
                    } // ForEach
                    .padding(.trailing,50)
                    Spacer()
                } // VStack
                .background(Color.white)
                //      .clipped()
                //      .ignoresSafeArea(edges: .trailing)
                // VStack
            }
            .frame(alignment: .leading)
            
        }
        .background(Color.red)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}
