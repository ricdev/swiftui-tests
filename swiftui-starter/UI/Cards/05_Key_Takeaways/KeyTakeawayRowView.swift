//
//  KeyTakeawayRowView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/27/22.
//

import SwiftUI

struct KeyTakeawayRowViewModifier: ViewModifier {
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
    func keyKeyTakeawayRowViewStyle(theme: Theme) -> some View {
        modifier(KeyTakeawayRowViewModifier(currentTheme: theme))
    }
}

struct KeyTakeawayRowView: View {
    @State var currentTheme: Theme = themes[0]
    @Binding var index: Int
    @Binding var data: KeyTakeaway

    private var numericalIndicator: String {
        return String(format: "%02d", index)
    }

    var body: some View {
        HStack(spacing: 20) {
            Text(numericalIndicator)
                .foregroundColor(currentTheme.brandColor)
                .scaledFont(name: FontFamily.FancyCutProB7.bold.name,
                            size: UIFontMetrics.default.scaledValue(for: 36))
                .frame(width: 45, alignment: .leading)
//                .frame(maxWidth: .none, alignment: .leading)

            Text($data.content.wrappedValue)
                .frame(maxWidth: .infinity, alignment: .leading)
        }.keyTakeawayViewStyle(theme: currentTheme)
    }
}

// swiftlint:disable line_length
struct KeyTakeawayRowView_Previews: PreviewProvider {

    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            KeyTakeawayRowView(currentTheme: themes[0], index: .constant(1), data: .constant(KeyTakeaway.sampleData))
            .preferredColorScheme($0)
        }
    }
}
