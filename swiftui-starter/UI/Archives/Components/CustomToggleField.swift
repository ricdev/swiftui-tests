//
//  CustomToggle.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/29/22.
//

import SwiftUI

@available(iOS 13.0, *)
struct ColoredToggleStyle: ToggleStyle {
    var label = ""
    var onColor = UIColor.label.toColor()
    var offColor = UIColor.systemGray.toColor()
    var thumbColor = Color.white

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            Spacer()
            RoundedRectangle(cornerRadius: 16, style: .circular)
                .fill(configuration.isOn ? onColor : offColor)
                .frame(width: 50, height: 29)
                .overlay(
                    Circle()
                        .fill(thumbColor)
                        .shadow(radius: 1, x: 0, y: 1)
                        .padding(1.5)
                        .offset(x: configuration.isOn ? 10 : -10))
                .animation(.easeIn, value: 0.1)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
        .font(.title)
        .padding(.horizontal)
    }
}

struct CustomToggleField: UIViewRepresentable {
    @Binding var isOn: Bool

    func makeCoordinator() -> CustomToggleField.Coordinator {
        Coordinator(isOn: $isOn)
    }

    func makeUIView(context: Context) -> UISwitch {
        let view = UISwitch()
        view.onTintColor = UIColor.secondaryLabel
        view.addTarget(context.coordinator, action: #selector(Coordinator.switchIsChanged(_:)), for: .valueChanged)

        return view
    }

    func updateUIView(_ uiView: UISwitch, context _: Context) {
        uiView.isOn = isOn
    }

    class Coordinator: NSObject {
        @Binding private var isOn: Bool

        init(isOn: Binding<Bool>) {
            _isOn = isOn
        }

        @objc func switchIsChanged(_ sender: UISwitch) {
            _isOn.wrappedValue = sender.isOn
        }
    }
}

struct CustomToggleField_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            VStack {
                CustomToggleField(isOn: .constant(true)).previewLayout(.fixed(width: 100, height: 100))
            }.padding().preferredColorScheme($0)
        }
    }
}
