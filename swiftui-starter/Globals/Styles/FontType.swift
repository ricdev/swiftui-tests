// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import SwiftUI
#if os(OSX)
  import AppKit.NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIFont
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "FontConvertible.Font", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias SystemFont = FontConvertible.SystemFont

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Fonts

// swiftlint:disable identifier_name line_length type_body_length
internal enum FontFamily {
  internal enum BrilliantCutProB7 {
    internal static let black = FontConvertible(name: "BrilliantCutProB7-Black", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Black.otf")
    internal static let bold = FontConvertible(name: "BrilliantCutProB7-Bold", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Bold.otf")
    internal static let light = FontConvertible(name: "BrilliantCutProB7-Light", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Light.otf")
    internal static let medium = FontConvertible(name: "BrilliantCutProB7-Medium", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Medium.otf")
    internal static let regular = FontConvertible(name: "BrilliantCutProB7-Regular", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Regular.otf")
    internal static let thin = FontConvertible(name: "BrilliantCutProB7-Thin", family: "Brilliant Cut Pro B7", path: "BrilliantCutProB7-Thin.otf")
    internal static let all: [FontConvertible] = [black, bold, light, medium, regular, thin]
  }
  internal enum FancyCutCondProB7 {
    internal static let bold = FontConvertible(name: "FancyCutCondProB7-Bold", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-Bold.otf")
    internal static let boldItalic = FontConvertible(name: "FancyCutCondProB7-BoldItalic", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-BoldItalic.otf")
    internal static let light = FontConvertible(name: "FancyCutCondProB7-Light", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-Light.otf")
    internal static let lightItalic = FontConvertible(name: "FancyCutCondProB7-LightItalic", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-LightItalic.otf")
    internal static let medium = FontConvertible(name: "FancyCutCondProB7-Medium", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-Medium.otf")
    internal static let mediumItalic = FontConvertible(name: "FancyCutCondProB7-MediumItalic", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-MediumItalic.otf")
    internal static let regular = FontConvertible(name: "FancyCutCondProB7-Regular", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-Regular.otf")
    internal static let regularItalic = FontConvertible(name: "FancyCutCondProB7-RegularItalic", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-RegularItalic.otf")
    internal static let thin = FontConvertible(name: "FancyCutCondProB7-Thin", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-Thin.otf")
    internal static let thinItalic = FontConvertible(name: "FancyCutCondProB7-ThinItalic", family: "Fancy Cut Cond Pro B7", path: "FancyCutCondProB7-ThinItalic.otf")
    internal static let all: [FontConvertible] = [bold, boldItalic, light, lightItalic, medium, mediumItalic, regular, regularItalic, thin, thinItalic]
  }
  internal enum FancyCutExtProB7 {
    internal static let bold = FontConvertible(name: "FancyCutExtProB7-Bold", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-Bold.otf")
    internal static let boldItalic = FontConvertible(name: "FancyCutExtProB7-BoldItalic", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-BoldItalic.otf")
    internal static let light = FontConvertible(name: "FancyCutExtProB7-Light", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-Light.otf")
    internal static let lightItalic = FontConvertible(name: "FancyCutExtProB7-LightItalic", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-LightItalic.otf")
    internal static let medium = FontConvertible(name: "FancyCutExtProB7-Medium", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-Medium.otf")
    internal static let mediumItalic = FontConvertible(name: "FancyCutExtProB7-MediumItalic", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-MediumItalic.otf")
    internal static let regular = FontConvertible(name: "FancyCutExtProB7-Regular", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-Regular.otf")
    internal static let regularItalic = FontConvertible(name: "FancyCutExtProB7-RegularItalic", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-RegularItalic.otf")
    internal static let thin = FontConvertible(name: "FancyCutExtProB7-Thin", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-Thin.otf")
    internal static let thinItalic = FontConvertible(name: "FancyCutExtProB7-ThinItalic", family: "Fancy Cut Ext Pro B7", path: "FancyCutExtProB7-ThinItalic.otf")
    internal static let all: [FontConvertible] = [bold, boldItalic, light, lightItalic, medium, mediumItalic, regular, regularItalic, thin, thinItalic]
  }
  internal enum FancyCutProB7 {
    internal static let bold = FontConvertible(name: "FancyCutProB7-Bold", family: "Fancy Cut Pro B7", path: "FancyCutProB7-Bold.otf")
    internal static let boldItalic = FontConvertible(name: "FancyCutProB7-BoldItalic", family: "Fancy Cut Pro B7", path: "FancyCutProB7-BoldItalic.otf")
    internal static let light = FontConvertible(name: "FancyCutProB7-Light", family: "Fancy Cut Pro B7", path: "FancyCutProB7-Light.otf")
    internal static let lightItalic = FontConvertible(name: "FancyCutProB7-LightItalic", family: "Fancy Cut Pro B7", path: "FancyCutProB7-LightItalic.otf")
    internal static let medium = FontConvertible(name: "FancyCutProB7-Medium", family: "Fancy Cut Pro B7", path: "FancyCutProB7-Medium.otf")
    internal static let mediumItalic = FontConvertible(name: "FancyCutProB7-MediumItalic", family: "Fancy Cut Pro B7", path: "FancyCutProB7-MediumItalic.otf")
    internal static let regular = FontConvertible(name: "FancyCutProB7-Regular", family: "Fancy Cut Pro B7", path: "FancyCutProB7-Regular.otf")
    internal static let regularItalic = FontConvertible(name: "FancyCutProB7-RegularItalic", family: "Fancy Cut Pro B7", path: "FancyCutProB7-RegularItalic.otf")
    internal static let thin = FontConvertible(name: "FancyCutProB7-Thin", family: "Fancy Cut Pro B7", path: "FancyCutProB7-Thin.otf")
    internal static let thinItalic = FontConvertible(name: "FancyCutProB7-ThinItalic", family: "Fancy Cut Pro B7", path: "FancyCutProB7-ThinItalic.otf")
    internal static let all: [FontConvertible] = [bold, boldItalic, light, lightItalic, medium, mediumItalic, regular, regularItalic, thin, thinItalic]
  }
  internal static let allCustomFonts: [FontConvertible] = [BrilliantCutProB7.all, FancyCutCondProB7.all, FancyCutExtProB7.all, FancyCutProB7.all].flatMap { $0 }
  internal static func registerAllCustomFonts() {
    allCustomFonts.forEach { $0.register() }
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal struct FontConvertible {
  internal let name: String
  internal let family: String
  internal let path: String

  #if os(OSX)
  internal typealias SystemFont = NSFont
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias SystemFont = UIFont
  #endif

  internal func font(size: CGFloat) -> SystemFont {
    guard let font = SystemFont(font: self, size: size) else {
      fatalError("Unable to initialize font '\(name)' (\(family))")
    }
    return font
  }

  internal func textStyle(_ textStyle: Font.TextStyle) -> Font {
    Font.mappedFont(name, textStyle: textStyle)
  }

  internal func register() {
    // swiftlint:disable:next conditional_returns_on_newline
    guard let url = url else { return }
    CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
  }

  fileprivate var url: URL? {
    // swiftlint:disable:next implicit_return
    return BundleToken.bundle.url(forResource: path, withExtension: nil)
  }
}

internal extension FontConvertible.SystemFont {
  convenience init?(font: FontConvertible, size: CGFloat) {
    #if os(iOS) || os(tvOS) || os(watchOS)
    if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
      font.register()
    }
    #elseif os(OSX)
    if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
      font.register()
    }
    #endif

    self.init(name: font.name, size: size)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}

fileprivate extension Font {
  static func mappedFont(_ name: String, textStyle: TextStyle) -> Font {
    let fontSize = UIFont.preferredFont(forTextStyle: self.mapToUIFontTextStyle(textStyle)).pointSize
    return Font.custom(name, size: fontSize, relativeTo: textStyle)
  }

  // swiftlint:disable:next cyclomatic_complexity
  static func mapToUIFontTextStyle(_ textStyle: SwiftUI.Font.TextStyle) -> UIFont.TextStyle {
    switch textStyle {
    case .largeTitle:
      return .largeTitle
    case .title:
      return .title1
    case .title2:
      return .title2
    case .title3:
      return .title3
    case .headline:
      return .headline
    case .subheadline:
      return .subheadline
    case .callout:
      return .callout
    case .body:
      return .body
    case .caption:
      return .caption1
    case .caption2:
      return .caption2
    case .footnote:
      return .footnote
    @unknown default:
      fatalError("Missing a TextStyle mapping")
    }
  }
}

// swiftlint:enable convenience_type
