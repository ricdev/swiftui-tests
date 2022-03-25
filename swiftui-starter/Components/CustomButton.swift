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
                    .foregroundColor(favourite ? Color.yellow : Color.gray )
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

struct RedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 16)
            .font(FontFamily.BrilliantCutProB7.bold.textStyle(.caption))
            .foregroundColor(.white)
            .background(Color(AppColor.red))
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
                StateButton(favourite: .constant(true), title: "Submit", action: { })

                CustomButton(title: "Submit", action: { })

                Button { } label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(RedButtonStyle())

                Button { } label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(ProgressButtonStyle(isLoading: true))

                Button { } label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(OutlineButton())

                Button { } label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(GradientBackgroundStyle(startColor: Color.pink, endColor: Color.purple))

                Button { } label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(RoundedCorners(color: Color.black))

                Button { } label: {
                    HStack {
                        Spacer()
                        Text("Submit")
                        Spacer()
                    }
                }.buttonStyle(GrowingButton())

            }.padding().preferredColorScheme($0)
        }
    }
}
