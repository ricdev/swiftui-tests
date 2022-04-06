//
//  UIView+Extensions.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/10/22.
//

import SwiftUI

extension View {

    // swiftlint:disable line_length
    func addBadge(alignment: Alignment = .topTrailing, imageName: String = "checkmark.circle.fill", xOffset: CGFloat = 3, yOffset: CGFloat = -3) -> some View {
        ZStack(alignment: alignment) {
            self

            Image(systemName: imageName).offset(x: xOffset, y: yOffset)
        }
    }

    func roundedCorner(cornerRadius: CGFloat = 8) -> some View {
        self
        .background(Color(UIColor.systemBackground))
        .padding(.all)
        .cornerRadius(cornerRadius)
    }
}

// todo: Navigation Handler
extension View {

    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

// todo: combine with navigational extensions -> navigate
extension AtlasLoginView {

    func redirectToLandingView() {
        let window = UIApplication
                    .shared
                    .connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }

        window?.rootViewController = UIHostingController(rootView: LandingView())
        window?.makeKeyAndVisible()
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}
