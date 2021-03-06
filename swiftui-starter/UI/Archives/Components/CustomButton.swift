//
//  CustomButton.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/25/22.
//

import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct StateButton: View {
    @Binding var favourite: Bool
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: {
            self.favourite.toggle()
        }) {
            HStack {
                Image(systemName: favourite ? "star.fill" : "star")
                    .foregroundColor(favourite ? Color.yellow : Color.gray)
                Text("Favourite")
            }
        }
    }
}

struct CustomButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(title, action: action)
            .foregroundColor(.white)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(8)
    }
}

struct FilledButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(isEnabled ? Color.accentColor : .gray)
            .cornerRadius(8)
    }
}

struct ProgressButtonStyle: ButtonStyle {
    let isLoading: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(isLoading ? 0 : 1)
            .overlay {
                if isLoading {
                    ProgressView()
                }
            }
    }
}

struct HeaderStyle: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.bodyFont)
            .foregroundColor(currentTheme.brandColor)
            .padding(12)
            .background(.thinMaterial)
            .shadow(color: .black, radius: 12, x: 4, y: 4)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .white.opacity(0.65), radius: 1, x: -1, y: -2)
            .shadow(color: .black.opacity(0.65), radius: 2, x: 2, y: 2)
    }
}

struct OutlineButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .accentColor)
            .padding()
            .background(
                RoundedRectangle(
                    cornerRadius: 8,
                    style: .continuous
                ).stroke(Color.accentColor)
            )
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    var foreground = Color.white
    var background = Color.blue

    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        MyButton(foreground: foreground, background: background, configuration: configuration)
    }

    struct MyButton: View {
        var foreground: Color
        var background: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .font(FontFamily.BrilliantCutProB7.bold.textStyle(.caption))
                .padding(EdgeInsets(top: 16.0, leading: 7.0, bottom: 16.0, trailing: 7.0))
                .frame(maxWidth: .infinity)
                .foregroundColor(isEnabled ? .white : Color.tertiaryLabel)
                .background(isEnabled ? (!configuration.isPressed ? Color(AppColor.red) : .black) : .clear)
                .background(
                    RoundedRectangle(
                        cornerRadius: 0,
                        style: .continuous
                    ).stroke(Color.tertiaryLabel))
        }
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    var foreground = Color.black
    var background = Color.white

    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        MyButton(foreground: foreground, background: background, configuration: configuration)
    }

    struct MyButton: View {
        var foreground: Color
        var background: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .font(FontFamily.BrilliantCutProB7.bold.textStyle(.caption))
                .padding(EdgeInsets(top: 16.0, leading: 7.0, bottom: 16.0, trailing: 7.0))
                .frame(maxWidth: .infinity)
                .foregroundColor(isEnabled ? (!configuration.isPressed ? .black : .red) : Color.tertiaryLabel)
                .background(.clear)
                .background(
                    RoundedRectangle(
                        cornerRadius: 0,
                        style: .continuous
                    ).stroke(isEnabled ? (!configuration.isPressed ? .black : .red) : Color.tertiaryLabel))
        }
    }
}

struct RedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 16)
            .font(FontFamily.BrilliantCutProB7.bold.textStyle(.caption))
            .foregroundColor(.white)
            .background(Color(AppColor.red))
    }
}

struct DisabledButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .accentColor)
            .padding()
            .background(
                RoundedRectangle(
                    cornerRadius: 0,
                    style: .continuous
                ).stroke(Color.tertiaryLabel)
            )
    }
}

struct LongPressButton: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .gesture(
                LongPressGesture()
                    .onEnded { _ in configuration.trigger() }
            )
    }
}

// swiftlint:disable line_length
struct GradientBackgroundStyle: ButtonStyle {
    var startColor: Color
    var endColor: Color
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .leading, endPoint: .trailing).opacity(configuration.isPressed ? 0.5 : 1))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .shadow(radius: 10)
    }
}

struct RoundedCorners: ButtonStyle {
    var color: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(color, lineWidth: 1)
            )
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            VStack {
                StateButton(favourite: .constant(true), title: "Submit", action: {})

                CustomButton(title: "Submit", action: {})

                Button {} label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(PrimaryButtonStyle())

                Button {} label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(SecondaryButtonStyle())

//                Button { } label: {
//                    HStack {
//                        Spacer()
//                        Text("Submit")
//                        Spacer()
//                    }
//                }.buttonStyle(DisabledButton())

                Button {} label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(ProgressButtonStyle(isLoading: true))

                Button {} label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(OutlineButton())

                Button {} label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(GradientBackgroundStyle(startColor: Color.pink, endColor: Color.purple))

                Button {} label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(RoundedCorners(color: Color.black))

                Button {} label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(GrowingButton())

                Button(action: {}, label: {})
                    .buttonStyle(SampleStyle(imageName: "plus.circle",
                                             title: "Add new item"))

//                Button(action: {}, label: {})
//                    .buttonStyle(SampleStyle(imageName: "minus.circle",
//                                             title: "Remove item"))

            }.padding().preferredColorScheme($0)
        }
    }

    struct SampleStyle: ButtonStyle {
        let imageName: String
        let title: String
        func makeBody(configuration: Self.Configuration) -> some View {
            HStack {
                Image(systemName: imageName)
                Text(title)
            }
            .padding(12)
            .background(!configuration.isPressed ?
                Color(UIColor.systemIndigo) :
                Color(UIColor.systemYellow))
            .foregroundColor(!configuration.isPressed ? .white : .black)
            .cornerRadius(8)
        }
    }
}
