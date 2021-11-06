//
//  ContentView.swift
//  DSC_Card
//
//  Created by Ali Raza on 06/11/2021.
//

import SwiftUI

struct Parallelogram: Shape {
    @State var percent: Double
    func path(in rect: CGRect) -> Path {
        let edge = rect.width * CGFloat (percent/100)
        var path = Path()
        path.move(to: CGPoint (x: rect.minX + edge, y:rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX + edge,y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - edge,y: rect.maxY ) )
        path.addLine(to: CGPoint (x: rect.minX - edge, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct Card: View {
    var name: String
    var position: String
    var positionStack: String
    var rollNo: String
    var linedIn: String
    var facebook: String
    var picture: String
    
    var body: some View{
        VStack{
            Text(name)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(position)
                .font(.subheadline)
                .fontWeight(.heavy)
                .foregroundColor(.green)
            Text(positionStack)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.green)
            Spacer(minLength: 1)
            ZStack{
                VStack{
                    Parallelogram(percent: 40)
                        .foregroundColor(.red)
                    .frame(width: 100.0, height: 100.0)
                    .offset(x:-100)

                    Spacer()


                    Parallelogram(percent: 40)
                        .foregroundColor(.yellow)
                        .offset(x:100)
                    .frame(width: 100.0, height: 100.0)

                }
                Image(picture)
                    .resizable()
                    .renderingMode(.original)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 300.0, height: 310.0)


            }
            .padding(.all)
            .frame(width: 150.0, height: 150.0)
            Spacer()
            ZStack{
                
                Image("rollbg")
                .resizable()
                .scaledToFill()
                    .frame(width: 200, height: 40)
                Text(rollNo)
                    .font(.title)
                    .fontWeight(.bold)
            }.padding(.all)
            
            HStack{
                Image("fb")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("@"+facebook)
            }
            HStack{
                Image("li")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("@"+facebook)
            }
            
            Image("DSClogo")
                .resizable()
                .scaledToFit()
                .padding(.all)
            
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack{
            
            Card(name: "Ali Raza", position: "Developer Lead", positionStack: "iOS", rollNo: "BCSF19M513", linedIn: "alirazamumtaz", facebook: "elirazamumtaz", picture: "ali")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
