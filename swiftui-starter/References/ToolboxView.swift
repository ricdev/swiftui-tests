//
//  ToolboxView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/24/22.
//

import SwiftUI

// swiftlint:disable line_length
struct ToolboxView1: View {

    var body: some View {
        VStack {
            EntryField(systemName: "envelope", placeHolder: "Email Address", prompt: "", field: .constant(""))
            EntryField(systemName: "envelope", placeHolder: "Email Address", prompt: "", field: .constant("user@gmail.com"))
            EntryField(systemName: "envelope", placeHolder: "Email Address", prompt: "Email is invalid.", field: .constant("user@gmail.com"))

            EntryField(systemName: "lock", placeHolder: "Password", prompt: "", field: .constant(""), isSecure: true)
            EntryField(systemName: "lock", placeHolder: "Password", prompt: "", field: .constant("user@gmail.com"), isSecure: true)
            EntryField(systemName: "lock", placeHolder: "Password", prompt: "Password is invalid.", field: .constant("user@gmail.com"), isSecure: true)

            HStack(alignment: .top) {
                VStack {
                    Text("Radio Group: ")
                }
                RadioButtonGroup(items: ["Rome", "London", "Paris", "Berlin", "New York"], selectedId: "London") { selected in print("Selected is: \(selected)")
                }
            }
            HStack {
                Text("Radio: ")
                RadioButton(checked: .constant(true))
                Spacer()
            }
            HStack {
                Text("Checkbox: ")
                CheckboxField(id: "Completed", label: "Completed", isMarked: .constant(true))
                Spacer()
            }
            Divider()
        }.padding()
    }
}

struct ToolboxView2: View {
    @State private var showingAlert = false

    var body: some View {
        VStack {
            AccordionView().frame(height: 200.0)
            Divider()

            Button {
                showingAlert = true
            } label: {
                HStack {
                    Spacer()
                    Text("INACTIVE")
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
                    Text("SECONDARY")
                    Spacer()
                }
            }
            .buttonStyle(PrimaryButtonStyle())
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Are you sure?"),
                    message: Text("Yes"),
                    primaryButton: .destructive(Text("Delete")) {
                        print("Deleting...")
                    },
                    secondaryButton: .cancel()
                )
            }
            Divider()
            Toggle(isOn: .constant(false)) {
                Text("Toggle")
            }.toggleStyle(CustomToggleStyle(color: .blue))
            Divider()
            CustomToggleField(isOn: .constant(true))
            Divider()
        }.padding()
    }
}

struct ToolboxView: View {

    var body: some View {
        ScrollView {
            VStack {
                ToolboxView2()
                ToolboxView1()

            }.padding()
        }
    }
}

struct ToolboxView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            HStack {
                ToolboxView()
            }.preferredColorScheme($0)
        }
    }
}
