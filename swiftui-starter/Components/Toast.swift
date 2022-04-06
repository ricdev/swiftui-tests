//
//  Toast.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/24/22.
//

import SwiftUI

enum ToastType {
    case success(message: String)
    case information(message: String)
    case error(message: String)
    case warning(message: String)
    case light(message: String)
    case dark(message: String)
}

// swiftlint:disable line_length
struct Toast<Presenting>: View where Presenting: View {

    @Binding var isShowing: Bool
    let presenting: () -> Presenting
    let type: ToastType

    var backgroundColor: Color {
        switch type {
        case .success:
            return AppColor.success10.toColor()
        case .information:
            return AppColor.information10.toColor()
        case .error:
            return AppColor.error10.toColor()
        case .warning:
            return AppColor.warning10.toColor()
        case .light:
            return AppColor.light10.toColor()
        case .dark:
            return AppColor.dark10.toColor()
        }
    }

    var foregroundColor: Color {
        switch type {
        case .success:
            return AppColor.success.toColor()
        case .information:
            return AppColor.information.toColor()
        case .error:
            return AppColor.error.toColor()
        case .warning:
            return AppColor.warning.toColor()
        case .light:
            return AppColor.light.toColor()
        case .dark:
            return AppColor.dark.toColor()
        }
    }

    var secondaryColor: Color {
        switch type {
        case .success:
            return AppColor.success60.toColor()
        case .information:
            return AppColor.information60.toColor()
        case .error:
            return AppColor.error60.toColor()
        case .warning:
            return AppColor.warning60.toColor()
        case .light:
            return AppColor.light60.toColor()
        case .dark:
            return AppColor.dark60.toColor()
        }
    }

    var toastMessage: String {
        switch type {
        case .success(let message):
            return message
        case .information(let message):
            return message
        case .error(let message):
            return message
        case .warning(let message):
            return message
        case .light(let message):
            return message
        case .dark(let message):
            return message
        }
    }

    var toastImage: Image {
        switch type {
        case .success:
            return Image(systemName: "checkmark.circle")
        case .information:
            return Image(systemName: "exclamationmark.circle")
        case .error:
            return Image(systemName: "xmark.circle")
        case .warning:
            return Image(systemName: "exclamationmark.circle")
        case .light:
            return Image(systemName: "exclamationmark.circle")
        case .dark:
            return Image(systemName: "exclamationmark.circle")
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
            ZStack(alignment: .bottom) {
                self.presenting()
                ZStack {
                    Capsule()
                        .fill(.white)
                    Capsule()
                        .fill(self.backgroundColor)
                    HStack {
                        self.toastImage
                            .padding(.leading, 20.0)
                            .padding(.trailing, 5.0)
                        Text(self.toastMessage).paragraph()
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }.foregroundColor(self.foregroundColor)
                }
                .frame(width: geometry.size.width / 1.25, height: geometry.size.height / 15)
                .overlay(RoundedRectangle(cornerRadius: geometry.size.height / 15).stroke(self.secondaryColor, lineWidth: 1))
                .opacity(self.isShowing ? 1 : 0)
                .padding(.bottom, geometry.size.height / 10)
            }
        }
    }
}

struct Paragraph: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 12.0,
                              weight: .regular,
                              design: .default))
    }
}

extension View {
    func paragraph() -> some View {
         return self.modifier(Paragraph())
    }
}

extension UIColor {
    func toColor() -> Color {
        return Color(self)
    }
}

extension View {
    func toast(isShowing: Binding<Bool>, type: ToastType) -> some View {
        Toast(isShowing: isShowing, presenting: { self }, type: type)
    }
}

// swiftlint:disable line_length
struct Toast_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            VStack {
            }
            .padding()
            .toast(isShowing: .constant(false), type: .error(message: "Success Message"))
            .toast(isShowing: .constant(false), type: .success(message: "Information Message Information Message Information Message Information Message"))
            .toast(isShowing: .constant(false), type: .warning(message: "Warning Message"))
            .toast(isShowing: .constant(true), type: .error(message: "Error Message"))
            .toast(isShowing: .constant(false), type: .light(message: "Light Message"))
            .toast(isShowing: .constant(false), type: .dark(message: "Dark Message"))
            .preferredColorScheme($0)
        }
    }
}
