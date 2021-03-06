//
//  FontTypeSheet.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/22/22.
//

import SwiftUI

public extension Font {
    init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
}

// swiftlint:disable cyclomatic_complexity
public extension UIFont {
    class func preferredFont(from font: Font) -> UIFont {
        let style: UIFont.TextStyle
        switch font {
        case .largeTitle: style = .largeTitle
        case .title: style = .title1
        case .title2: style = .title2
        case .title3: style = .title3
        case .headline: style = .headline
        case .subheadline: style = .subheadline
        case .callout: style = .callout
        case .caption: style = .caption1
        case .caption2: style = .caption2
        case .footnote: style = .footnote
        case .body: style = .body
        default: style = .body
        }
        return UIFont.preferredFont(forTextStyle: style)
    }
}

// swiftlint:disable line_length
struct FontListFancyCutProB7Bold: View {
    var body: some View {
        VStack {
            Group {
                Text("THE BIG BROWN FOX JUMPS OVER THE LAZY DOG.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.largeTitle))
            }
            Group {
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.largeTitle))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.title))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.title2))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.title3))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.headline))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.subheadline))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.callout))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.body))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.caption))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.caption2))
            }
            Group {
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.bold.textStyle(.footnote))
            }
        }
    }
}

// swiftlint:disable line_length
struct FontListFancyCutProB7Medium: View {
    var body: some View {
        VStack {
            Group {
                Text("THE BIG BROWN FOX JUMPS OVER THE LAZY DOG.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.largeTitle))
            }
            Group {
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.largeTitle))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.title))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.title2))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.title3))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.headline))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.subheadline))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.callout))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.body))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.caption))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.caption2))
            }
            Group {
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.FancyCutProB7.medium.textStyle(.footnote))
            }
        }
    }
}

// swiftlint:disable line_length
struct FontListBrilliantCutProB7Black: View {
    var body: some View {
        VStack {
            Group {
                Text("THE BIG BROWN FOX JUMPS OVER THE LAZY DOG.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.largeTitle))
            }
            Group {
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.largeTitle))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.title))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.title2))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.title3))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.headline))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.subheadline))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.callout))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.body))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.caption))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.caption2))
            }
            Group {
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.black.textStyle(.footnote))
            }
        }
    }
}

// swiftlint:disable line_length
struct FontListBrilliantCutProB7Regular: View {
    var body: some View {
        VStack {
            Group {
                Text("THE BIG BROWN FOX JUMPS OVER THE LAZY DOG.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.largeTitle))
            }
            Group {
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.largeTitle))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.title))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.title2))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.title3))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.headline))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.subheadline))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.callout))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.body))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.caption))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.caption2))
            }
            Group {
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.regular.textStyle(.footnote))
            }
        }
    }
}

// swiftlint:disable line_length
struct FontListBrilliantCutProB7Medium: View {
    var body: some View {
        VStack {
            Group {
                Text("THE BIG BROWN FOX JUMPS OVER THE LAZY DOG.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.largeTitle))
            }
            Group {
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.largeTitle))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.title))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.title2))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.title3))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.headline))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.subheadline))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.callout))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.body))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.caption))
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.caption2))
            }
            Group {
                Text("The big brown fox jumps over the lazy dog.").frame(maxWidth: .infinity, alignment: .leading).font(FontFamily.BrilliantCutProB7.medium.textStyle(.footnote))
            }
        }
    }
}

struct FontTypesView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Group {
                        FontListFancyCutProB7Bold()
                        Divider()
                        FontListFancyCutProB7Medium()
                        Divider()
                        FontListBrilliantCutProB7Black()
                        Divider()
                        FontListBrilliantCutProB7Regular()
                        Divider()
                        FontListBrilliantCutProB7Medium()
                    }
                }
                .padding()
            }
            .navigationTitle("Font Types")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FontTypesView_Previews: PreviewProvider {
    static var previews: some View {
        FontTypesView()
    }
}
