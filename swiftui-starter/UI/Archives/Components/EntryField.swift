//
//  EntryField.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/25/22.
//

import SwiftUI

// swiftlint:disable line_length
struct BoxedEntryField: View {
    var systemName: String
    var placeHolder: String
    var prompt: String
    @Binding var field: String
    var isSecure: Bool = false

    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: systemName)
                    .foregroundColor(.gray)
                    .font(.headline)
                if isSecure {
                    SecureField(placeHolder, text: $field).autocapitalization(.none)
                } else {
                    TextField(placeHolder, text: $field).autocapitalization(.none).foregroundColor(prompt.isEmpty ? .primary : .red)
                }
            }
            .padding(8)
            .background(Color(UIColor.secondarySystemBackground))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(prompt.isEmpty ? Color.gray : Color.red, lineWidth: 1))
            Text(prompt)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(prompt.isEmpty ? .gray : .red)
                .font(.caption)
        }
    }
}

struct EntryField: View {
    var systemName: String
    var placeHolder: String
    var prompt: String
    @Binding var field: String
    var isSecure: Bool = false

    @FocusState private var isFocused: Bool
    @State private var borderWidth: CGFloat = 2.0
    @State private var isEmpty: Bool = true

    @Environment(\.colorScheme) var colorScheme

    init(systemName: String, placeHolder: String, prompt: String, field: Binding<String>, isSecure: Bool = false) {
        self.systemName = systemName
        self.placeHolder = placeHolder
        self.prompt = prompt
        _field = field
        self.isSecure = isSecure
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(placeHolder.uppercased()).frame(maxWidth: .infinity, alignment: .leading)
                .font(FontFamily.BrilliantCutProB7.medium.textStyle(.footnote))
                .padding(.bottom, -9)
                .autocapitalization(.allCharacters)

            ZStack {
                Rectangle().frame(height: borderWidth)
                    .padding(.horizontal, 0)
                    .padding(.top, self.isEmptyAndUnfocused() == true ? 34 : 0)
                    .foregroundColor(Color.systemBackground.colorInvert() as? Color)

                HStack {
                    if isSecure {
                        SecureField("", text: $field.onChange { current in
                            self.isEmpty = current.isEmpty
                        })
                        .autocapitalization(.none)
                        .foregroundColor(prompt.isEmpty ? .primary : .red)
                        .focused($isFocused)
                        .onChange(of: isFocused) { _ in
                            switch isFocused {
                            case true: borderWidth = 1.0
                            case false: borderWidth = 2.0
                            }
                        }
                    } else {
                        TextField("", text: $field.onChange { current in
                            self.isEmpty = current.isEmpty
                        })
                        .autocapitalization(.none)
                        .foregroundColor(prompt.isEmpty ? .primary : .red)
                        .focused($isFocused)
                        .onChange(of: isFocused) { _ in
                            switch isFocused {
                            case true: borderWidth = 1.0
                            case false: borderWidth = 2.0
                            }
                        }
                    }
                    if !prompt.isEmpty && !self.isEmpty {
                        Image(Asset.iconFieldValidationError.name)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 10.0, height: 10.0)
                    }
                }.padding(.bottom, self.isEmptyAndUnfocused() == true ? 0 : 8)
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }

    func isEmptyAndUnfocused() -> Bool {
        if isFocused == true { return true }
        if !(field.isEmpty && isEmpty) { return true }
        return false
    }
}

protocol TextModifier {
    associatedtype Body: View

    func body(text: Text) -> Body
}

extension Text {
    func modifier<TM: TextModifier>(_ theModifier: TM) -> some View {
        return theModifier.body(text: self)
    }
}

struct ActiveEquationString: TextModifier {
    let termInd: Int
    @Binding var currentInd: Int

    func body(text: Text) -> some View {
        return text
            .underline(currentInd == termInd)
            .foregroundColor(currentInd == termInd ? Color.black : Color.gray)
    }
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

// swiftlint:disable line_length
struct EntryField_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            VStack {
                EntryField(systemName: "envelope", placeHolder: "Email", prompt: "", field: .constant(""))
                EntryField(systemName: "envelope", placeHolder: "Email", prompt: "", field: .constant("user@gmail.com"))
                EntryField(systemName: "envelope", placeHolder: "Email", prompt: "Email is invalid.", field: .constant("user@gmail.com"))
                EntryField(systemName: "lock", placeHolder: "Password", prompt: "", field: .constant(""), isSecure: true)
                EntryField(systemName: "lock", placeHolder: "Password", prompt: "", field: .constant("Test123"), isSecure: true)
                EntryField(systemName: "lock", placeHolder: "Password", prompt: "Password is invalid.", field: .constant("Test123"), isSecure: true)
            }.padding().preferredColorScheme($0)
        }
    }
}
