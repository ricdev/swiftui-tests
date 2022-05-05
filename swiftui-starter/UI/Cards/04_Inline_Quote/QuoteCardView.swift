//
//  QuoteCardView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 5/4/22.
//

import SwiftUI

// swiftlint:disable line_length
struct QuoteCardView: View {

    @State var currentTheme: Theme = themes[0]
    @Binding var data: Quote
    var indicatorCount: Int
    var indicatorIndex: Int

    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(.clear)
                    .frame(maxWidth: .infinity, maxHeight: 40)

                HStack(spacing: 0) {
                    VStack(spacing: 0) {
                        Image(R.image.imgBlackVerticalRectangle.name)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                        Rectangle()
                            .fill(AppColor.themeBlack.toColor())
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(width: 40)
                    Rectangle()
                        .fill(AppColor.gray1.toColor())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }

                Spacer()
            }

            VStack() {
                Image(R.image.imgQuote.name)
                    .padding(.leading, 20)

                Text(data.content)
                    .kerning(1.1)
                    .foregroundColor(currentTheme.primaryColor)
                    .font(FontFamily.FancyCutProB7.medium.textStyle(.title2))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 80)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)

                HStack(spacing: 0) {

                    Text(data.author.capitalized)
                        .kerning(1.1)
                        .foregroundColor(currentTheme.primaryColor)
                        .font(FontFamily.FancyCutProB7.bold.textStyle(.subheadline))
                        .frame(minWidth: 10, alignment: .topLeading)
                        .padding(.leading, 80)

                    Text(", \(data.title.uppercased())")
                        .kerning(1.1)
                        .foregroundColor(currentTheme.primaryColor)
                        .font(FontFamily.FancyCutProB7.medium.textStyle(.subheadline))
                        .setStyle(type: .ctaStyle(theme: currentTheme))
                        .frame(minWidth: 10, alignment: .topLeading)

                    Spacer()
                }

                HStack(spacing: 10) {
                    ForEach((0..<indicatorCount), id: \.self) { index in
                        Circle()
                            .strokeBorder(indicatorIndex == index ? Color.primary : Color.systemGray.opacity(0.5), lineWidth: 2)
                            .background(Circle().fill(indicatorIndex == index ? Color.primary : Color.systemGray.opacity(0.0)))
                            .frame(width: 10, height: 10)
                    }

                    Spacer()
                }
                .padding(.leading, 80)
                .padding(.top, 20)

                Spacer()
            }
        }
    }
}

struct QuoteCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCardView(currentTheme: themes[0],
                      data: .constant(Quote(content: "content", author: "author", title: "title")),
                      indicatorCount: 5,
                      indicatorIndex: 1)
    }
}
