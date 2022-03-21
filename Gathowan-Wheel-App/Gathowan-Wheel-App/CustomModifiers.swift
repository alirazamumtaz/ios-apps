//
//  CustomModifiers.swift
//  Gathowan-Wheel-App
//
//  Created by Ali Raza on 10/03/2022.
//

import SwiftUI

struct CustomRotate: ViewModifier {
    @State private var currentAngle: Angle = .degrees(0)
    @State private var finalAngle: Angle = .degrees(0)
    func body(content: Content) -> some View {
        content
            .rotationEffect(currentAngle )
            .gesture(
                RotationGesture()
                    .onChanged{ angle in
                        currentAngle = angle
                    }
                    .onEnded { angle in
                        finalAngle = angle
                    }
            )
    }
}

struct CustomTextFiledModifire: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color(UIColor.systemBackground))
                            .frame(width: 40.0, height: 40.0)
            )
            .multilineTextAlignment(.center)
            .frame(width: 40.0, height: 40.0)
            .shadow(color: .gray, radius: 5, x: 0, y: 5)
    }
}

struct CustomPickerStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .pickerStyle(WheelPickerStyle())
            .compositingGroup()
            .font(.title)
            .frame(width: 40.0, height: 40.0)
            .clipped(antialiased: true)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemBackground)))
            .shadow(color: .gray, radius: 5, x: 0, y: 5)
    }
}

struct CustomResultDesccription: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(UIColor.systemBackground))
            .font(.headline)
            .frame(width: 40, height: 40)
            .background(Circle().fill(Color.black))
    }
}

struct CustomOption: ViewModifier {
    let colorIdx: Int
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.caption)
            .frame(width: 30, height: 30)
            .background(
                Circle()
                    .fill(color[colorIdx])
                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
            )
            .padding(.leading)
    }
}

struct CustomOptionDescription: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 30)
            .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.systemBackground))
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
            )
        
    }
}

struct CustomInputDesgin: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color(UIColor.systemBackground))
            .frame(width: 50.0, height: 50.0))
            .multilineTextAlignment(.center)
            .frame(width: 50.0, height: 50.0)
            .shadow(color: .gray, radius: 5, x: 0, y: 5)
    }
}

struct CustomHeading: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
    }
}
