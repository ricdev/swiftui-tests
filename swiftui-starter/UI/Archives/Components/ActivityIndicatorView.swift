//
//  ActivityIndicatorView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/18/22.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context _: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context _: UIViewRepresentableContext<ActivityIndicatorView>) {
        uiView.startAnimating()
    }
}
