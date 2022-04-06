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
