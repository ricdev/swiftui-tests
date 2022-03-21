//
//  BackgroundView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/14/22.
//

// Lottie source file https://lottiefiles.com/70532-background

import SwiftUI
import Lottie

typealias Context = UIViewRepresentableContext

struct BackgroundView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .loop

    var animationView = AnimationView()

    func makeUIView(context: UIViewRepresentableContext<BackgroundView>) -> UIView {
        let view = UIView(frame: .zero)

        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<BackgroundView>) { }
}
