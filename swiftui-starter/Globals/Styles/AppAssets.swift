// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let feat = ImageAsset(name: "Feat")
  internal static let iconBlackAddCurate = ImageAsset(name: "icon-black-add-curate")
  internal static let iconBlackAddTakeaway = ImageAsset(name: "icon-black-add-takeaway")
  internal static let iconBlackAdd = ImageAsset(name: "icon-black-add")
  internal static let iconBlackArrowAccordionDownDisabled = ImageAsset(name: "icon-black-arrow-accordion-down-disabled")
  internal static let iconBlackArrowAccordionDown = ImageAsset(name: "icon-black-arrow-accordion-down")
  internal static let iconBlackArrowAccordionUp = ImageAsset(name: "icon-black-arrow-accordion-up")
  internal static let iconBlackArrowLeft = ImageAsset(name: "icon-black-arrow-left")
  internal static let iconBlackArrowRight = ImageAsset(name: "icon-black-arrow-right")
  internal static let iconBlackBoldClose = ImageAsset(name: "icon-black-bold-close")
  internal static let iconBlackBookmarkSmall = ImageAsset(name: "icon-black-bookmark-small")
  internal static let iconBlackBookmark = ImageAsset(name: "icon-black-bookmark")
  internal static let iconBlackCloseTakeaway = ImageAsset(name: "icon-black-close-takeaway")
  internal static let iconBlackClose = ImageAsset(name: "icon-black-close")
  internal static let iconBlackDownload = ImageAsset(name: "icon-black-download")
  internal static let iconBlackError = ImageAsset(name: "icon-black-error")
  internal static let iconBlackExternalLink = ImageAsset(name: "icon-black-external-link")
  internal static let iconBlackEye = ImageAsset(name: "icon-black-eye")
  internal static let iconBlackFindBoutique = ImageAsset(name: "icon-black-find-boutique")
  internal static let iconBlackImage = ImageAsset(name: "icon-black-image")
  internal static let iconBlackLogout = ImageAsset(name: "icon-black-logout")
  internal static let iconBlackPencil = ImageAsset(name: "icon-black-pencil")
  internal static let iconBlackProfile = ImageAsset(name: "icon-black-profile")
  internal static let iconBlackRemove = ImageAsset(name: "icon-black-remove")
  internal static let iconBlackResources = ImageAsset(name: "icon-black-resources")
  internal static let iconBlackSearchCurateDisabled = ImageAsset(name: "icon-black-search-curate-disabled")
  internal static let iconBlackSearchCurate = ImageAsset(name: "icon-black-search-curate")
  internal static let iconBlackSearch = ImageAsset(name: "icon-black-search")
  internal static let iconBlackStar = ImageAsset(name: "icon-black-star")
  internal static let iconBlackTrash = ImageAsset(name: "icon-black-trash")
  internal static let iconBookmark = ImageAsset(name: "icon-bookmark")
  internal static let iconFieldValidationError = ImageAsset(name: "icon-field-validation-error")
  internal static let iconFieldValidationInfo = ImageAsset(name: "icon-field-validation-info")
  internal static let iconGrayDelete = ImageAsset(name: "icon-gray-delete")
  internal static let iconRedError = ImageAsset(name: "icon-red-error")
  internal static let iconRedRightTriangle = ImageAsset(name: "icon-red-right-triangle")
  internal static let iconSearchTextfieldCloseWhite = ImageAsset(name: "icon-search-textfield-close-white")
  internal static let iconSearchTextfieldClose = ImageAsset(name: "icon-search-textfield-close")
  internal static let iconWhiteAddCurate = ImageAsset(name: "icon-white-add-curate")
  internal static let iconWhiteAddTakeaway = ImageAsset(name: "icon-white-add-takeaway")
  internal static let iconWhiteArrowAccordionDown = ImageAsset(name: "icon-white-arrow-accordion-down")
  internal static let iconWhiteArrowAccordionUp = ImageAsset(name: "icon-white-arrow-accordion-up")
  internal static let iconWhiteArrowLeft = ImageAsset(name: "icon-white-arrow-left")
  internal static let iconWhiteArrowRight = ImageAsset(name: "icon-white-arrow-right")
  internal static let iconWhiteBookmarkSmall = ImageAsset(name: "icon-white-bookmark-small")
  internal static let iconWhiteBookmark = ImageAsset(name: "icon-white-bookmark")
  internal static let iconWhiteClose = ImageAsset(name: "icon-white-close")
  internal static let iconWhiteDeleteDisabled = ImageAsset(name: "icon-white-delete-disabled")
  internal static let iconWhiteDelete = ImageAsset(name: "icon-white-delete")
  internal static let iconWhiteDownload = ImageAsset(name: "icon-white-download")
  internal static let iconWhiteError = ImageAsset(name: "icon-white-error")
  internal static let iconWhiteExternalLink = ImageAsset(name: "icon-white-external-link")
  internal static let iconWhiteEye = ImageAsset(name: "icon-white-eye")
  internal static let iconWhiteFindBoutique = ImageAsset(name: "icon-white-find-boutique")
  internal static let iconWhiteImage = ImageAsset(name: "icon-white-image")
  internal static let iconWhiteProfile = ImageAsset(name: "icon-white-profile")
  internal static let iconWhiteRemove = ImageAsset(name: "icon-white-remove")
  internal static let iconWhiteResources = ImageAsset(name: "icon-white-resources")
  internal static let iconWhiteSearch = ImageAsset(name: "icon-white-search")
  internal static let iconWhiteStar = ImageAsset(name: "icon-white-star")
  internal static let iconWhiteWhiteAdd = ImageAsset(name: "icon-white-white-add")
  internal static let imgAssetGradient = ImageAsset(name: "img-asset-gradient")
  internal static let imgAssetHero = ImageAsset(name: "img-asset-hero")
  internal static let imgAtlas = ImageAsset(name: "img-atlas")
  internal static let imgBlackCutoff = ImageAsset(name: "img-black-cutoff")
  internal static let imgBlackVerticalRectangle = ImageAsset(name: "img-black-vertical-rectangle")
  internal static let imgButtonBackBlack = ImageAsset(name: "img-button-back-black")
  internal static let imgButtonBack = ImageAsset(name: "img-button-back")
  internal static let imgCartierAtlasLogo = ImageAsset(name: "img-cartier-atlas-logo")
  internal static let imgEndBriefBackground = ImageAsset(name: "img-endBrief-background")
  internal static let imgFeaturedAssetDefault = ImageAsset(name: "img-featured-asset-default")
  internal static let imgGoldHexagonView = ImageAsset(name: "img-gold-hexagon-view")
  internal static let imgGoldHexagon = ImageAsset(name: "img-gold-hexagon")
  internal static let imgGoldPdf = ImageAsset(name: "img-gold-pdf")
  internal static let imgGoldSwipeArrowsRight = ImageAsset(name: "img-gold-swipe-arrows-right")
  internal static let imgGoldTakeaway = ImageAsset(name: "img-gold-takeaway")
  internal static let imgGrayBackground = ImageAsset(name: "img-gray-background")
  internal static let imgLinearGradient = ImageAsset(name: "img-linear-gradient")
  internal static let imgLoginArtifact1 = ImageAsset(name: "img-login-artifact-1")
  internal static let imgLoginArtifact2 = ImageAsset(name: "img-login-artifact-2")
  internal static let imgLoginArtifact3 = ImageAsset(name: "img-login-artifact-3")
  internal static let imgLogoCartier = ImageAsset(name: "img-logo-cartier")
  internal static let imgPatternBrief = ImageAsset(name: "img-pattern-brief")
  internal static let imgPatternImmersive = ImageAsset(name: "img-pattern-immersive")
  internal static let imgPolygonNavResources = ImageAsset(name: "img-polygon-nav-resources")
  internal static let imgPolygonResources = ImageAsset(name: "img-polygon-resources")
  internal static let imgProfileBackground = ImageAsset(name: "img-profile-background")
  internal static let imgQuote = ImageAsset(name: "img-quote")
  internal static let imgRedArrows = ImageAsset(name: "img-red-arrows")
  internal static let imgRedBigHexagon = ImageAsset(name: "img-red-big-hexagon")
  internal static let imgRedBox2 = ImageAsset(name: "img-red-box-2")
  internal static let imgRedHexagon = ImageAsset(name: "img-red-hexagon")
  internal static let imgTopGradient = ImageAsset(name: "img-top-gradient")
  internal static let imgWhiteTriangle = ImageAsset(name: "img-white-triangle")
  internal static let imgGoldCheetah = ImageAsset(name: "img_gold_cheetah")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = Color(asset: self)

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
// swiftlint:enable convenience_type
