//
//  ModalContentView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/6/22.
//

import SwiftUI

struct ModalView: View { // draws a semi-transparent rectangle that contains the modal
    @Binding var showModal: Bool

    var body: some View {
        Group {
            if showModal {
                Rectangle()
                    .foregroundColor(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        GeometryReader { geometry in
                            VStack {
                                Color.clear.overlay(RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(.white)
                                    .frame(
                                        width: geometry.size.width * 0.75,
                                        height: geometry.size.height / 3 * 0.75
                                    ))
                                    .overlay(ModalContentView(showModal: self.$showModal))
                            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    )
            }
        }
    }
}

// swiftlint:disable multiple_closures_with_trailing_closure
struct ModalContentView: View { // the real modal content
    @Binding var showModal: Bool

    var body: some View {
        VStack {
            Text("Modal Content")

            Button(action: {
                self.showModal.toggle()
            }) {
                HStack {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.large)
                    Text("Close Modal")
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
