//
//  RadioButton.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/29/22.
//

import SwiftUI

struct RadioButton: View {
    @Binding var checked: Bool

    var body: some View {
        Group {
            if checked {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 8, height: 8)
                }.onTapGesture { self.checked = false }
            } else {
                Circle()
                    .fill(Color.white)
                    .frame(width: 20, height: 20)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    .onTapGesture { self.checked = true }
            }
        }
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            HStack {
                Text("Radio: ")
                RadioButton(checked: .constant(true))
                Spacer()
            }.padding().preferredColorScheme($0)
        }
    }
}
