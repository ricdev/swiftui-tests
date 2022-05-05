//
//  KeyTakeawaysView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/27/22.
//

import SwiftUI

struct KeyTakeawaysViewModifier: ViewModifier {
    @State var currentTheme: Theme = themes[0]

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .foregroundColor(UIColor.label.toColor())
            .background(UIColor.systemBackground.toColor())
            .setStyle(type: .body2Style(theme: currentTheme))
    }
}

extension View {
    func keyTakeawaysViewStyle(theme: Theme) -> some View {
        modifier(KeyTakeawaysViewModifier(currentTheme: theme))
    }
}

struct KeyTakeawaysView: View {
    @State var currentTheme: Theme = themes[0]
    @Binding var data: KeyTakeaways

    var body: some View {
        Group {
            VStack() {
                Text("Key Takeaways".uppercased())
                    .kerning(1.1)
                    .foregroundColor(currentTheme.primaryColor)
                    .setStyle(type: .ctaStyle(theme: currentTheme))
                    .frame(maxWidth: .infinity, alignment: .leading)

                List {
                    ForEach(Array(data.contents.enumerated()), id: \.offset) { index, content in
                        KeyTakeawayRowView(currentTheme: currentTheme,
                                           index: .constant(index + 1),
                                           data: .constant(content))
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 20, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .listStyle(GroupedListStyle())
                .onAppear(perform: {
                    UITableView.appearance().contentInset.top = -35
                })
            }
        }.keyTakeawayViewStyle(theme: currentTheme)
    }
}

struct KeyTakeawaysView_Previews: PreviewProvider {

    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            KeyTakeawaysView(currentTheme: themes[0], data: .constant(KeyTakeaways.sampleData))
            .preferredColorScheme($0)
        }
    }
}
