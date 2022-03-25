//
//  ToolboxView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/24/22.
//

import SwiftUI

// swiftlint:disable line_length
struct EntryField: View {
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

// swiftlint:disable line_length
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            VStack {
                EntryField(systemName: "envelope", placeHolder: "Email Address", prompt: "", field: .constant(""))
                EntryField(systemName: "envelope", placeHolder: "Email Address", prompt: "", field: .constant("user@gmail.com"))
                EntryField(systemName: "envelope", placeHolder: "Email Address", prompt: "Email is invalid.", field: .constant("user@gmail.com"))
                EntryField(systemName: "lock", placeHolder: "Password", prompt: "", field: .constant(""), isSecure: true)
                EntryField(systemName: "lock", placeHolder: "Password", prompt: "", field: .constant("user@gmail.com"), isSecure: true)
                EntryField(systemName: "lock", placeHolder: "Password", prompt: "Password is invalid.", field: .constant("user@gmail.com"), isSecure: true)
            }.padding().preferredColorScheme($0)
        }
    }
}
