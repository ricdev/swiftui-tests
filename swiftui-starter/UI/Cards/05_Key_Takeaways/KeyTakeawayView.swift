//
//  KeyTakeaway.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/27/22.
//

import SwiftUI

struct KeyTakeawayViewModifier: ViewModifier {
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
    func keyTakeawayViewStyle(theme: Theme) -> some View {
        modifier(KeyTakeawayViewModifier(currentTheme: theme))
    }
}

struct KeyTakeawayView: View {
    @State var currentTheme: Theme = themes[0]
    @Binding var data: KeyTakeaway

    var body: some View {
        Group {
            VStack(spacing: 20.0) {
                Text("Key Takeaways".uppercased())
                    .kerning(1.1)
                    .foregroundColor(currentTheme.primaryColor)
                    .setStyle(type: .ctaStyle(theme: currentTheme))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text($data.content.wrappedValue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.keyTakeawayViewStyle(theme: currentTheme)
    }
}

struct KeyTakeawayView_Previews: PreviewProvider {

    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            KeyTakeawayView(currentTheme: themes[0], data: .constant(KeyTakeaway.sampleData))
            .preferredColorScheme($0)
        }
    }
}
