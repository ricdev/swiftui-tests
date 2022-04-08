//
//  Theme.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/7/22.
//

import SwiftUI

enum ThemeName {
    case primaryTheme
    case secondaryTheme
}

enum Fonts {
    case articleTitleFont
    case articleTitleCardFont
    case eyebrowFont
    case bodySmallFont
    case chapterTitleFont
    case bodyFont
    case bodyFont2
    case bodyFont3
    case bodyFont4
    case quoteFont
    case timestampFont
    case ctaFont
}

// swiftlint:disable:next cyclomatic_complexity
func getFont(name: Fonts) -> Font {
    switch name {
    case .articleTitleFont:
        let scaledSize = UIFontMetrics.default.scaledValue(for: 28)
        return .custom(FontFamily.BrilliantCutProB7.medium.name, size: scaledSize)
    case .articleTitleCardFont:
        let scaledSize = UIFontMetrics.default.scaledValue(for: 22)
        return .custom(FontFamily.BrilliantCutProB7.medium.name, size: scaledSize)
    case .eyebrowFont:
        let scaledSize = UIFontMetrics.default.scaledValue(for: 10)
        return .custom(FontFamily.BrilliantCutProB7.bold.name, size: scaledSize)
    case .bodySmallFont:
        let scaledSize = UIFontMetrics.default.scaledValue(for: 16)
        return .custom(FontFamily.FancyCutProB7.bold.name, size: scaledSize)
    case .chapterTitleFont:
        let scaledSize = UIFontMetrics.default.scaledValue(for: 14)
        return .custom(FontFamily.BrilliantCutProB7.medium.name, size: scaledSize)
    case .bodyFont:
        let scaledSize = UIFontMetrics.default.scaledValue(for: 18)
        return .custom(FontFamily.FancyCutProB7.regular.name, size: scaledSize)
    case .bodyFont2:
        let scaledSize = UIFontMetrics.default.scaledValue(for: 18)
        return .custom(FontFamily.FancyCutProB7.bold.name, size: scaledSize)
    case .bodyFont3:
        let scaledSize = UIFontMetrics.default.scaledValue(for: 18)
        return .custom(FontFamily.FancyCutProB7.boldItalic.name, size: scaledSize)
    case .bodyFont4:
        let scaledSize = UIFontMetrics.default.scaledValue(for: 18)
        return .custom(FontFamily.FancyCutProB7.regularItalic.name, size: scaledSize)
    case .quoteFont:
        let scaledSize = UIFontMetrics.default.scaledValue(for: 29)
        return .custom(FontFamily.FancyCutProB7.light.name, size: scaledSize)
    case .timestampFont: return Font(uiFont: FontFamily.FancyCutProB7.bold.font(size: 12))
    case .ctaFont:
        let scaledSize = UIFontMetrics.default.scaledValue(for: 10)
        return .custom(FontFamily.BrilliantCutProB7.bold.name, size: scaledSize)
    }
}

class Theme: ObservableObject {
    @Published var brandColor: Color
    @Published var backgroundColor: Color
    @Published var contrastBackgroundColor: Color
    @Published var secondaryColor: Color
    @Published var shadowColor: Color
    @Published var bodyTextColor: Color

    @Published var articleTitleFont: Font
    @Published var articleTitleCardFont: Font
    @Published var eyebrowFont: Font
    @Published var bodySmallFont: Font
    @Published var chapterTitleFont: Font
    @Published var bodyFont: Font
    @Published var bodyFont2: Font
    @Published var bodyFont3: Font
    @Published var bodyFont4: Font
    @Published var quoteFont: Font
    @Published var timestampFont: Font
    @Published var ctaFont: Font

    @Published var largeSpacing: CGFloat
    @Published var mediumSpacing: CGFloat
    @Published var smallSpacing: CGFloat

    init(brandColor: Color,
         backgroundColor: Color,
         contrastBackgroundColor: Color,
         secondaryColor: Color,
         shadowColor: Color,
         bodyTextColor: Color,

         articleTitleFont: Font,
         articleTitleCardFont: Font,
         eyebrowFont: Font,
         bodySmallFont: Font,
         chapterTitleFont: Font,
         bodyFont: Font,
         bodyFont2: Font,
         bodyFont3: Font,
         bodyFont4: Font,
         quoteFont: Font,
         timestampFont: Font,
         ctaFont: Font,

         largeSpacing: CGFloat,
         mediumSpacing: CGFloat,
         smallSpacing: CGFloat) {

        self.brandColor = brandColor
        self.backgroundColor = backgroundColor
        self.contrastBackgroundColor = contrastBackgroundColor
        self.secondaryColor = secondaryColor
        self.shadowColor = shadowColor
        self.bodyTextColor = bodyTextColor

        self.articleTitleFont = articleTitleFont
        self.articleTitleCardFont = articleTitleCardFont
        self.eyebrowFont = eyebrowFont
        self.bodySmallFont = bodySmallFont
        self.chapterTitleFont = chapterTitleFont
        self.bodyFont = bodyFont
        self.bodyFont2 = bodyFont2
        self.bodyFont3 = bodyFont3
        self.bodyFont4 = bodyFont4
        self.quoteFont = quoteFont
        self.timestampFont = timestampFont
        self.ctaFont = ctaFont

        self.largeSpacing = largeSpacing
        self.mediumSpacing = mediumSpacing
        self.smallSpacing = smallSpacing
    }
}

var themes: [Theme] = [

    // Primary Theme
    Theme(brandColor: AppColor.themeRed.toColor(),
          backgroundColor: AppColor.themeBlack.toColor(),
          contrastBackgroundColor: AppColor.gray.toColor(),
          secondaryColor: .secondaryLabel,
          shadowColor: .tertiaryLabel,
          bodyTextColor: .primary,

          articleTitleFont: getFont(name: .articleTitleFont),
          articleTitleCardFont: getFont(name: .articleTitleCardFont),
          eyebrowFont: getFont(name: .eyebrowFont),
          bodySmallFont: getFont(name: .bodySmallFont),
          chapterTitleFont: getFont(name: .chapterTitleFont),
          bodyFont: getFont(name: .bodyFont),
          bodyFont2: getFont(name: .bodyFont2),
          bodyFont3: getFont(name: .bodyFont3),
          bodyFont4: getFont(name: .bodyFont4),
          quoteFont: getFont(name: .quoteFont),
          timestampFont: getFont(name: .timestampFont),
          ctaFont: getFont(name: .ctaFont),

          largeSpacing: 16.0,
          mediumSpacing: 12.0,
          smallSpacing: 4.0
         ),

    // Secondary Theme
    Theme(brandColor: AppColor.themeWhite.toColor(),
          backgroundColor: AppColor.themeBlack.toColor(),
          contrastBackgroundColor: AppColor.gray.toColor(),
          secondaryColor: .secondaryLabel,
          shadowColor: .tertiaryLabel,
          bodyTextColor: .primary,

          articleTitleFont: getFont(name: .articleTitleFont),
          articleTitleCardFont: getFont(name: .articleTitleCardFont),
          eyebrowFont: getFont(name: .eyebrowFont),
          bodySmallFont: getFont(name: .bodySmallFont),
          chapterTitleFont: getFont(name: .chapterTitleFont),
          bodyFont: getFont(name: .bodyFont),
          bodyFont2: getFont(name: .bodyFont2),
          bodyFont3: getFont(name: .bodyFont3),
          bodyFont4: getFont(name: .bodyFont4),
          quoteFont: getFont(name: .quoteFont),
          timestampFont: getFont(name: .timestampFont),
          ctaFont: getFont(name: .ctaFont),

          largeSpacing: 16.0,
          mediumSpacing: 6.0,
          smallSpacing: 4.0
         )
]

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
