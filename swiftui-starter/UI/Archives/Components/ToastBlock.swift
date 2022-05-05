//
//  ToastBlock.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/6/22.
//

import SwiftUI

enum ToastBlockType {
    case error(message: String)
}

struct ToastBlock<Presenting>: View where Presenting: View {
    @Binding var isShowing: Bool
    let presenting: () -> Presenting
    let type: ToastBlockType

    var backgroundColor: Color {
        switch type {
        case .error:
            return AppColor.themeRed.toColor()
        }
    }

    var foregroundColor: Color {
        switch type {
        case .error:
            return AppColor.themeWhite.toColor()
        }
    }

    var secondaryColor: Color {
        switch type {
        case .error:
            return AppColor.error60.toColor()
        }
    }

    var toastMessage: String {
        switch type {
        case let .error(message):
            return message
        }
    }

    var toastImage: Image {
        switch type {
        case .error:
            return Image(systemName: "xmark.circle")
        }
    }

    var body: some View {
        if self.isShowing {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isShowing = false
                }
            }
        }
        return GeometryReader { geometry in
            ZStack(alignment: .top) {
                self.presenting()
                ZStack {
                    Rectangle()
                        .fill(.white)
                    Rectangle()
                        .fill(self.backgroundColor)
                    HStack {
                        self.toastImage
                            .padding(.leading, 20.0)
                            .padding(.trailing, 5.0)
                        Text(self.toastMessage).paragraph()
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                        Spacer()
                    }
                    .foregroundColor(self.foregroundColor)
                    .padding(.top, 40)
                }
                .frame(maxWidth: .infinity)
                .frame(height: geometry.size.height / 5)
                .overlay(RoundedRectangle(cornerRadius: 0).stroke(self.secondaryColor, lineWidth: 1))
                .opacity(self.isShowing ? 1 : 0)
                .padding(.bottom, 0)
            }.ignoresSafeArea()
        }
    }
}

extension View {
    func toastBlock(isShowing: Binding<Bool>, type: ToastBlockType) -> some View {
        ToastBlock(isShowing: isShowing, presenting: { self }, type: type)
    }
}

struct ToastBlock_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            VStack {}
                .padding()
                .toastBlock(isShowing: .constant(true), type: .error(message: "Success Message"))
                .preferredColorScheme($0)
        }
    }
}
