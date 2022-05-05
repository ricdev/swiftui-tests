//
//  ThemeView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/7/22.
//

import SwiftUI

struct ThemeView: View {
    @State var currentTheme: Theme = themes[0]

    func changeTheme(name: ThemeName) {
        switch name {
        case .secondaryTheme: currentTheme = themes[1]
        default: currentTheme = themes[0]
        }
    }

    var body: some View {
        VStack {
            Group {
                Text("Article title - Lorem Ipsum dolor sit amet".uppercased())
                    .kerning(1.1)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .articleTitleStyle(theme: currentTheme))

                Divider()

                Text("Article title card - Lorem Ipsum dolor sit amet".uppercased())
                    .kerning(1.1)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .articleTitleCardStyle(theme: currentTheme))

                Divider()

                Text("Eyebrow - Lorem Ipsum dolor sit amet".uppercased())
                    .kerning(1.1)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .eyebrowStyle(theme: currentTheme))

                Divider()

                Text("Body Small - Lorem Ipsum dolor sit amet")
                    .kerning(1.4)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .bodySmallStyle(theme: currentTheme))

                Divider()

                Text("Chapter title - Lorem Ipsum dolor sit amet".uppercased())
                    .kerning(1.2)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .chapterTitleStyle(theme: currentTheme))

                Divider()
            }

            Group {
                Text("Body - Lorem Ipsum dolor sit amet")
                    .kerning(1.55)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .bodyStyle(theme: currentTheme))

                Divider()

                Text("Body 2 - Lorem Ipsum dolor sit amet")
                    .kerning(1.55)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .body2Style(theme: currentTheme))

                Divider()

                Text("Body 3 - Lorem Ipsum dolor sit amet")
                    .kerning(1.55)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .body3Style(theme: currentTheme))

                Divider()

                Text("Body 4 - Lorem Ipsum dolor sit amet")
                    .kerning(1.55)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .body4Style(theme: currentTheme))

                Divider()

                Text("Quote - Lorem Ipsum dolor sit amet".capitalized)
                    .kerning(1.2)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .quoteStyle(theme: currentTheme))

                Divider()
            }

            Group {
                Text("Timestamp - Lorem Ipsum dolor sit amet".uppercased())
                    .kerning(1.0)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .timestampStyle(theme: currentTheme))

                Divider()

                Text("CTA - Lorem Ipsum dolor sit amet".uppercased())
                    .kerning(1.1)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .ctaStyle(theme: currentTheme))

                Divider()

                Text("CTA - Lorem Ipsum dolor sit amet".uppercased())
                    .kerning(1.1)
                    .foregroundColor(currentTheme.brandColor)
                    .setStyle(type: .ctaStyle(theme: currentTheme))
            }

            Button("Toggle Theme") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    changeTheme(name: .secondaryTheme)
                }
            }.scaledFont(name: "Georgia", size: 12)
        }
    }
}

enum AppStyleType {
    case articleTitleStyle(theme: Theme)
    case articleTitleCardStyle(theme: Theme)
    case eyebrowStyle(theme: Theme)
    case bodySmallStyle(theme: Theme)
    case chapterTitleStyle(theme: Theme)
    case bodyStyle(theme: Theme)
    case body2Style(theme: Theme)
    case body3Style(theme: Theme)
    case body4Style(theme: Theme)
    case quoteStyle(theme: Theme)
    case timestampStyle(theme: Theme)
    case ctaStyle(theme: Theme)
}

struct AppStyle: ViewModifier {
    let type: AppStyleType

    // swiftlint:disable:next cyclomatic_complexity
    func body(content: Content) -> some View {
        switch type {
        case let .articleTitleStyle(theme: theme):
            content.articleTitleStyle(theme: theme)
        case let .articleTitleCardStyle(theme: theme):
            content.articleTitleCardStyle(theme: theme)
        case let .eyebrowStyle(theme: theme):
            content.eyebrowStyle(theme: theme)
        case let .bodySmallStyle(theme: theme):
            content.bodySmallStyle(theme: theme)
        case let .chapterTitleStyle(theme: theme):
            content.chapterTitleStyle(theme: theme)
        case let .bodyStyle(theme: theme):
            content.bodyStyle(theme: theme)
        case let .body2Style(theme: theme):
            content.body2Style(theme: theme)
        case let .body3Style(theme: theme):
            content.body3Style(theme: theme)
        case let .body4Style(theme: theme):
            content.body4Style(theme: theme)
        case let .quoteStyle(theme: theme):
            content.quoteStyle(theme: theme)
        case let .timestampStyle(theme: theme):
            content.timestampStyle(theme: theme)
        case let .ctaStyle(theme: theme):
            content.ctaStyle(theme: theme)
        }
    }
}

extension View {
    func setStyle(type: AppStyleType) -> some View {
        modifier(AppStyle(type: type))
    }

    func articleTitleStyle(theme: Theme) -> some View {
        modifier(ArticleTitleStyle(currentTheme: theme))
    }

    func articleTitleCardStyle(theme: Theme) -> some View {
        modifier(ArticleTitleCardStyle(currentTheme: theme))
    }

    func eyebrowStyle(theme: Theme) -> some View {
        modifier(EyebrowStyle(currentTheme: theme))
    }

    func bodySmallStyle(theme: Theme) -> some View {
        modifier(BodySmallStyle(currentTheme: theme))
    }

    func chapterTitleStyle(theme: Theme) -> some View {
        modifier(ChapterTitleStyle(currentTheme: theme))
    }

    func bodyStyle(theme: Theme) -> some View {
        modifier(BodyStyle(currentTheme: theme))
    }

    func body2Style(theme: Theme) -> some View {
        modifier(Body2Style(currentTheme: theme))
    }

    func body3Style(theme: Theme) -> some View {
        modifier(Body3Style(currentTheme: theme))
    }

    func body4Style(theme: Theme) -> some View {
        modifier(Body4Style(currentTheme: theme))
    }

    func quoteStyle(theme: Theme) -> some View {
        modifier(QuoteStyle(currentTheme: theme))
    }

    func timestampStyle(theme: Theme) -> some View {
        modifier(TimestampStyle(currentTheme: theme))
    }

    func ctaStyle(theme: Theme) -> some View {
        modifier(CTAStyle(currentTheme: theme))
    }
}

struct ArticleTitleStyle: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.articleTitleFont)
            .foregroundColor(currentTheme.brandColor)
    }
}

struct ArticleTitleCardStyle: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.articleTitleCardFont)
            .foregroundColor(currentTheme.brandColor)
    }
}

struct EyebrowStyle: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.eyebrowFont)
            .foregroundColor(currentTheme.brandColor)
    }
}

struct BodySmallStyle: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.bodySmallFont)
            .foregroundColor(currentTheme.brandColor)
    }
}

struct ChapterTitleStyle: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.chapterTitleFont)
            .foregroundColor(currentTheme.brandColor)
    }
}

struct BodyStyle: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.bodyFont)
            .foregroundColor(currentTheme.brandColor)
    }
}

struct Body2Style: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.bodyFont2)
            .foregroundColor(currentTheme.brandColor)
    }
}

struct Body3Style: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.bodyFont3)
            .foregroundColor(currentTheme.brandColor)
    }
}

struct Body4Style: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.bodyFont4)
            .foregroundColor(currentTheme.brandColor)
    }
}

struct QuoteStyle: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.quoteFont)
            .foregroundColor(currentTheme.brandColor)
    }
}

struct TimestampStyle: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.timestampFont)
            .foregroundColor(currentTheme.brandColor)
    }
}

struct CTAStyle: ViewModifier {
    @ObservedObject var currentTheme: Theme
    func body(content: Content) -> some View {
        content
            .font(currentTheme.ctaFont)
            .foregroundColor(currentTheme.brandColor)
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

@available(iOS 13, macCatalyst 13, tvOS 13, watchOS 6, *)
extension View {
    func scaledFont(name: String, size: CGFloat) -> some View {
        return modifier(ScaledFont(name: name, size: size))
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            HStack {
                ThemeView()
            }
            .padding()
            .preferredColorScheme($0)
        }
    }
}
