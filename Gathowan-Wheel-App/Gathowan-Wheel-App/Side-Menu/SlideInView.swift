//
//  SlideInView.swift
//  wheel-information
//
//  Created by Ali Raza on 28/02/2022.
//

import SwiftUI

public struct SlideInView<Content: View, Container: View>: View {
    
    @Binding private var isActive: Bool
    private var edge: Edge
    private var paddingPercentage: CGFloat
    private var options: SlideInViewOptions
    private var content: () -> Content
    private var container: () -> Container
    
    public init(isActive: Binding<Bool>,
                edge: Edge = .leading,
                paddingPercentage: CGFloat = 0.35,
                options: SlideInViewOptions = SlideInViewOptions(),
                content: @escaping () -> Content,
                container: @escaping () -> Container) {
        self._isActive = isActive
        self.edge = edge
        self.paddingPercentage = paddingPercentage
        self.options = options
        self.content = content
        self.container = container
    }
    
    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                container()
                
                ZStack {
                    if isActive {
                        options.paddingColor
                            .opacity(options.paddingColorOpacity)
                            .ignoresSafeArea()
                            .onTapGesture {
                                if options.shouldDismissUponExternalTap {
                                    isActive.toggle()
                                }
                            }
                        content()
                            .padding(getPaddingEdgeSet(), getPadding(for: proxy))
                            .transition(
                                .asymmetric(
                                    insertion: .move(edge: edge),
                                    removal: .move(edge: edge)
                                )
                            )
                            .gesture(DragGesture(minimumDistance: 20, coordinateSpace: .global)
                                        .onEnded { value in
                                if options.shouldDismissUponSwipe {
                                    let horizontalAmount = value.translation.width as CGFloat
                                    let verticalAmount = value.translation.height as CGFloat
                                    
                                    if abs(horizontalAmount) > abs(verticalAmount) {
                                        if horizontalAmount < 0 {
                                            if edge == .leading {
                                                isActive.toggle()
                                            }
                                        } else if edge == .trailing {
                                            isActive.toggle()
                                        }
                                    } else {
                                        if verticalAmount < 0 {
                                            if edge == .top {
                                                isActive.toggle()
                                            }
                                        } else if edge == .bottom {
                                            isActive.toggle()
                                        }
                                    }
                                }
                                
                            })
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .animation(.default, value: isActive)
            }
        }
    }
}

public extension SlideInView {
    private func getPaddingEdgeSet() -> Edge.Set {
        switch edge {
        case .top:
            return .bottom
        case .leading:
            return .trailing
        case .bottom:
            return .top
        case .trailing:
            return .leading
        }
    }
    
    private func getPadding(for proxy: GeometryProxy) -> CGFloat {
        switch edge {
        case .top, .bottom:
            return proxy.size.height * paddingPercentage
        case .leading, .trailing:
            return proxy.size.width * paddingPercentage
        }
    }
}

public struct SlideInViewOptions {
    public var paddingColor: Color
    public var paddingColorOpacity: CGFloat
    public var shouldDismissUponSwipe: Bool
    public var shouldDismissUponExternalTap: Bool
    
    public init(paddingColor: Color = Color(.label),
         paddingColorOpacity: CGFloat = 0.1,
         shouldDismissUponSwipe: Bool = true,
         shouldDismissUponExternalTap: Bool = true) {
        self.paddingColor = paddingColor
        self.paddingColorOpacity = paddingColorOpacity
        self.shouldDismissUponSwipe = shouldDismissUponSwipe
        self.shouldDismissUponExternalTap = shouldDismissUponExternalTap
    }
}

public extension View {
    
    func slideInView<Content: View>(isActive: Binding<Bool>, edge: Edge = .leading, paddingPercentage: CGFloat = 0.3, options: SlideInViewOptions = SlideInViewOptions(), content: @escaping () -> Content) -> some View {
        SlideInView(isActive: isActive, edge: edge, paddingPercentage: paddingPercentage, options: options, content: content) {
            self
        }
    }
}
