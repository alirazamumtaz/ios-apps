//
//  DialView.swift
//  dial
//
//  Created by Ali Raza on 01/03/2022.
//

import SwiftUI

struct Dial: View {
    @Binding public var value: Double
    public var minValue: Double = 0
    public var maxValue: Double = .greatestFiniteMagnitude
    public var divisor: Double = 1
    public var stepping: Double = 1
    @State private var dialAngle: Angle = .zero
    @State private var dialShadowAngle: Angle = .zero
    @State private var dialReleaseAngle: Angle = .zero
    @State private var dialStartAngle: Angle = .zero
    @State private var isDialRotating: Bool = false
    @State private var dialRevolutions: Int = 0

    var adjustedDivisor: Double {
        divisor > 0 ? divisor : 1
    }

    var adjustedStepping: Double {
        stepping > 0 ? stepping : 1
    }

    var adjustedMinValue: Double {
        (minValue * adjustedDivisor) / adjustedStepping
    }

    var adjustedMaxValue: Double {
        (maxValue * adjustedDivisor) / adjustedStepping
    }

    var metallicGradient: AngularGradient {
        let spectrum = [
            Color(UIColor.systemGray2),
            Color(UIColor.systemGray3),
            Color(UIColor.systemGray4),
            Color(UIColor.systemGray5),
            Color(UIColor.systemGray4),
            Color(UIColor.systemGray3),
            Color(UIColor.systemGray2),
            Color(UIColor.systemGray3),
            Color(UIColor.systemGray4),
            Color(UIColor.systemGray5),
            Color(UIColor.systemGray4),
            Color(UIColor.systemGray3),
            Color(UIColor.systemGray2),
        ]
        return AngularGradient(
            gradient: Gradient(colors: spectrum),
            center: .center,
            angle: .degrees(45)
        )
    }

    var body: some View {
        GeometryReader { geometry in
//            ZStack() {
//                Image("outerTire")
//                Circle()
//                    .fill(metallicGradient)
//                    .rotationEffect(.init(degrees: 90), anchor: .center)
//                    .shadow(color: Color(UIColor.systemGray2), radius: 24)

//                Circle()
//                    .fill(metallicGradient)
                Image("innerTire")
                .scaleEffect(0.5, anchor: .center)
//            }
            .rotationEffect(dialAngle)
            .gesture(rotationDragGesture(geometry: geometry))
        }
    }

    private func rotationDragGesture(geometry: GeometryProxy) -> some Gesture {
        let frame = geometry.frame(in: .local)
        let center = CGPoint(x: frame.midX, y: frame.midY)
        return DragGesture()
            .onChanged { value in
                if !isDialRotating {
                    isDialRotating = true
                    dialStartAngle = rotationAngle(of: value.startLocation, around: center)
                }

                let dialCurrentAngle = rotationAngle(of: value.location, around: center)
                let dragAngleDelta = dialCurrentAngle - dialStartAngle
                let newDialAngle = dialReleaseAngle + dragAngleDelta
                let dialAngleDelta = newDialAngle - dialAngle
                let prevDialAngle = dialAngle

                // This is the actual angle of the dial that's drawn on the screen.
                dialAngle += dialAngleDelta
                // This is the angle that's used to calculate self.value. If the dial
                // is turned past minValue or maxValue and then back, this angle will
                // start to diverge from dialAngle. This is so that the dial on the screen
                // can continue to rotate past minValue or maxValue while dialShadowValue
                // doesn't change (i.e. remains constant). If dialValue didn't change,
                // the dial wouldn't be able to rotate freely past minValue or maxValue.
                dialShadowAngle += dialAngleDelta

                if abs(dialAngle - prevDialAngle) > Angle(degrees: 360) - abs(dragAngleDelta) {
                    let offset = dragAngleDelta.radians <= 0 ? 1 : -1
                    dialRevolutions += offset
                }
                let totalDegrees = (Double(dialRevolutions) * 360) + dialShadowAngle.degrees
                self.value = min(adjustedMaxValue, max(adjustedMinValue, floor(totalDegrees / adjustedDivisor) * adjustedStepping))

                if totalDegrees <= adjustedMinValue {
                    dialRevolutions = Int(adjustedMinValue / 360)
                    dialShadowAngle = .degrees(adjustedMinValue.truncatingRemainder(dividingBy: 360))
                } else if totalDegrees >= adjustedMaxValue {
                    dialRevolutions = Int(adjustedMaxValue / 360)
                    dialShadowAngle = .degrees(adjustedMaxValue.truncatingRemainder(dividingBy: 360))
                }
            }
            .onEnded { _ in
                dialReleaseAngle = dialAngle
                print(dialReleaseAngle)
                print(dialReleaseAngle.degrees)
                isDialRotating = false
            }
    }

    private func abs(_ angle: Angle) -> Angle {
        .radians(Swift.abs(angle.radians))
    }

    private func rotationAngle(of point: CGPoint, around center: CGPoint) -> Angle {
        let deltaY = point.y - center.y
        let deltaX = point.x - center.x
        return Angle(radians: Double(atan2(deltaY, deltaX)))
    }
}

struct Dial_Previews: PreviewProvider {
    static var previews: some View {
        Dial(value: .constant(0))
//            .frame(width: 250)
//            .padding(.all, 24)
    }
}
