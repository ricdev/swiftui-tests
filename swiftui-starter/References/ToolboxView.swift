//
//  ToolboxView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/24/22.
//

import SwiftUI

// swiftlint:disable line_length
struct ToolboxView_Previews: PreviewProvider {
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
