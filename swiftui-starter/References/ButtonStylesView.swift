//
//  StylesView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/30/22.
//

import SwiftUI

struct ThemedButtons: View {
    @State private var showingAlert = false

    var body: some View {
        VStack {

            Button {
                showingAlert = true
            } label: {
                HStack {
                    Spacer()
                    Text("INACTIVE PRIMARY")
                    Spacer()
                }
            }
            .buttonStyle(PrimaryButtonStyle())
            .disabled(true)

            Button {
                showingAlert = true
            } label: {
                HStack {
                    Spacer()
                    Text("PRIMARY")
                    Spacer()
                }
            }
            .buttonStyle(PrimaryButtonStyle())

            Button {
                showingAlert = true
            } label: {
                HStack {
                    Spacer()
                    Text("INACTIVE SECONDARY")
                    Spacer()
                }
            }
            .buttonStyle(SecondaryButtonStyle())
            .disabled(true)

            Button {
                showingAlert = true
            } label: {
                HStack {
                    Spacer()
                    Text("SECONDARY")
                    Spacer()
                }
            }
            .buttonStyle(SecondaryButtonStyle())

            Divider()
        }.padding()
    }
}

struct StylesView: View {

    var body: some View {
        VStack {
            ThemedButtons()
        }
    }
}

struct StylesView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            HStack {
                StylesView()
            }.preferredColorScheme($0)
        }
    }
}
