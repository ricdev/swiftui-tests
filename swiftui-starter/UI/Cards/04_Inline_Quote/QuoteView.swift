//
//  QuoteView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 5/4/22.
//

import SwiftUI

// swiftlint:disable line_length
struct QuoteView: View {

    @State var currentTheme: Theme = themes[0]
    @Binding var data: Quotes

    var arrayView: [AnyView] {
        var items: [AnyView] = []
        var index = 0
        for content in data.contents {
            items.append(AnyView(QuoteCardView(currentTheme: currentTheme, data: .constant(content), indicatorCount: data.contents.count, indicatorIndex: index)))
            index += 1
        }
        return items
    }

    var body: some View {
        ZStack {
            CarouselView(itemHeight: 500, views: arrayView)
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(currentTheme: themes[0], data: .constant(Quotes.sampleData))
    }
}

//            VStack {
//                Spacer().frame(height: 30)
//                Text("INFINITE CAROUSEL")
//                    .font(.system(size: 50, weight: .semibold)).multilineTextAlignment(.center)
//                Spacer()
//            }
//    @State var value = ""
//    @State var heartFilled = false
//                AnyView(
//                    VStack {
//                        Circle().frame(width: 50, height: 50).foregroundColor(.red).padding()
//                        Circle().frame(width: 50, height: 50).foregroundColor(.red).padding()
//                        Circle().frame(width: 50, height: 50).foregroundColor(.red).padding()
//
//                }),
//                AnyView(Text("view number 2")),
//                AnyView(TextField("placeholder", text: $value).padding().multilineTextAlignment(.center)),
//                AnyView(Text("the textfield said '\(value == "" ? "..." : value)'")),
//                AnyView(
//                    ZStack {
//                        if heartFilled {
//                            Image(systemName: "heart")
//                        } else {
//                            Image(systemName: "heart.fill")
//                        }
//                    }
//                ),
//                AnyView(
//                    // swiftlint:disable multiple_closures_with_trailing_closure
//                    Button(action: {
//                        self.heartFilled.toggle()
//                    }) {
//                        HStack {
//                            Text("Fill the heart")
//                        }
//                    }
//                ),
//                ForEach(Array(data.contents.enumerated()), id: \.offset) { index, content in
//                    AnyView()
//                    Text(content.content)
//                }
