//
//  ColorPallete.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/25/22.
//

import SwiftUI

struct ColorCode {
    let name: String
    let color: Color

    static var colors: [ColorCode] { [
        ColorCode(name: "lightText", color: .lightText),
        ColorCode(name: "darkText", color: .darkText),
        ColorCode(name: "placeholderText", color: .placeholderText),
        ColorCode(name: "label", color: .label),
        ColorCode(name: "secondaryLabel", color: .secondaryLabel),
        ColorCode(name: "tertiaryLabel", color: .tertiaryLabel),
        ColorCode(name: "quaternaryLabel", color: .quaternaryLabel),
        ColorCode(name: "systemBackground", color: .systemBackground),
        ColorCode(name: "secondarySystemBackground", color: .secondarySystemBackground),
        ColorCode(name: "tertiarySystemBackground", color: .tertiarySystemBackground),
        ColorCode(name: "systemFill", color: .systemFill),
        ColorCode(name: "secondarySystemFill", color: .secondarySystemFill),
        ColorCode(name: "tertiarySystemFill", color: .tertiarySystemFill),
        ColorCode(name: "quaternarySystemFill", color: .quaternarySystemFill),
        ColorCode(name: "systemGroupedBackground", color: .systemGroupedBackground),
        ColorCode(name: "secondarySystemGroupedBackground", color: .secondarySystemGroupedBackground),
        ColorCode(name: "tertiarySystemGroupedBackground", color: .tertiarySystemGroupedBackground),
        ColorCode(name: "systemGray", color: .systemGray),
        ColorCode(name: "systemGray2", color: .systemGray2),
        ColorCode(name: "systemGray3", color: .systemGray3),
        ColorCode(name: "systemGray4", color: .systemGray4),
        ColorCode(name: "systemGray5", color: .systemGray5),
        ColorCode(name: "systemGray6", color: .systemGray6),
        ColorCode(name: "separator", color: .separator),
        ColorCode(name: "opaqueSeparator", color: .opaqueSeparator),
        ColorCode(name: "link", color: .link),
        ColorCode(name: "systemRed", color: .systemRed),
        ColorCode(name: "systemBlue", color: .systemBlue),
        ColorCode(name: "systemPink", color: .systemPink),
        ColorCode(name: "systemTeal", color: .systemTeal),
        ColorCode(name: "systemGreen", color: .systemGreen),
        ColorCode(name: "systemIndigo", color: .systemIndigo),
        ColorCode(name: "systemOrange", color: .systemOrange),
        ColorCode(name: "systemPurple", color: .systemPurple),
        ColorCode(name: "systemYellow", color: .systemYellow)]
    }
}

extension Color {

    // MARK: - Text Colors
    static let lightText = Color(UIColor.lightText)
    static let darkText = Color(UIColor.darkText)
    static let placeholderText = Color(UIColor.placeholderText)

    // MARK: - Label Colors
    static let label = Color(UIColor.label)
    static let secondaryLabel = Color(UIColor.secondaryLabel)
    static let tertiaryLabel = Color(UIColor.tertiaryLabel)
    static let quaternaryLabel = Color(UIColor.quaternaryLabel)

    // MARK: - Background Colors
    static let systemBackground = Color(UIColor.systemBackground)
    static let secondarySystemBackground = Color(UIColor.secondarySystemBackground)
    static let tertiarySystemBackground = Color(UIColor.tertiarySystemBackground)

    // MARK: - Fill Colors
    static let systemFill = Color(UIColor.systemFill)
    static let secondarySystemFill = Color(UIColor.secondarySystemFill)
    static let tertiarySystemFill = Color(UIColor.tertiarySystemFill)
    static let quaternarySystemFill = Color(UIColor.quaternarySystemFill)

    // MARK: - Grouped Background Colors
    static let systemGroupedBackground = Color(UIColor.systemGroupedBackground)
    static let secondarySystemGroupedBackground = Color(UIColor.secondarySystemGroupedBackground)
    static let tertiarySystemGroupedBackground = Color(UIColor.tertiarySystemGroupedBackground)

    // MARK: - Gray Colors
    static let systemGray = Color(UIColor.systemGray)
    static let systemGray2 = Color(UIColor.systemGray2)
    static let systemGray3 = Color(UIColor.systemGray3)
    static let systemGray4 = Color(UIColor.systemGray4)
    static let systemGray5 = Color(UIColor.systemGray5)
    static let systemGray6 = Color(UIColor.systemGray6)

    // MARK: - Other Colors
    static let separator = Color(UIColor.separator)
    static let opaqueSeparator = Color(UIColor.opaqueSeparator)
    static let link = Color(UIColor.link)

    // MARK: System Colors
    static let systemBlue = Color(UIColor.systemBlue)
    static let systemPurple = Color(UIColor.systemPurple)
    static let systemGreen = Color(UIColor.systemGreen)
    static let systemYellow = Color(UIColor.systemYellow)
    static let systemOrange = Color(UIColor.systemOrange)
    static let systemPink = Color(UIColor.systemPink)
    static let systemRed = Color(UIColor.systemRed)
    static let systemTeal = Color(UIColor.systemTeal)
    static let systemIndigo = Color(UIColor.systemIndigo)
}

struct ColorPaletteView: View {
    var body: some View {
        VStack {
            HStack {
                Text("")
                    .frame(width: 150, alignment: .leading)
                Text("Light")
                    .frame(width: 75, height: 40)
                Text("Dark")
                    .frame(width: 75, height: 40)
            }
            List(ColorCode.colors, id: \.name) { color in
                HStack {
                    Text(color.name)
                        .frame(width: 150, alignment: .leading)
                    Rectangle()
                        .environment(\.colorScheme, .light)
                        .frame(width: 75, height: 40)
                        .foregroundColor(color.color)
                        .border(Color.black, width: 2)
                    Rectangle()
                        .environment(\.colorScheme, .dark)
                        .frame(width: 75, height: 40)
                        .foregroundColor(color.color)
                        .border(Color.black, width: 2)
                }
            }
        }
    }
}

struct ColorPaletteView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            ColorPaletteView().padding().preferredColorScheme($0)
        }
    }
}
