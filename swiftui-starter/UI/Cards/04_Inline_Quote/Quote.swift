//
//  Quote.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 5/4/22.
//

import Foundation

struct Quotes: Identifiable {
    var id: UUID
    var contents: [Quote]

    init(id: UUID = UUID(), contents: [Quote]) {
        self.id = id
        self.contents = contents
    }
}

struct Quote: Identifiable {
    var id: UUID
    var content: String
    var author: String
    var title: String

    init(id: UUID = UUID(), content: String, author: String, title: String) {
        self.id = id
        self.content = content
        self.author = author
        self.title = title
    }
}

// swiftlint:disable line_length
extension Quotes {
    static let sampleData: Quotes = Quotes(contents: [
        Quote(content: "First ring made of three interlaced individual bands. Lorem ipsum dolor sit amet, consectetur adipiscing clit.", author: "abcdefghi", title: "123456"),
        Quote(content: "First ring made of three interlaced individual bands. Lorem ipsum dolor sit amet, consectetur adipiscing clit.", author: "abcdefghi", title: "123456"),
        Quote(content: "The harmonious interplay betweenthe bands create an expression of attachment. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.", author: "abcdefghi", title: "123456"),
        Quote(content: "Relaunched by Cartier in 1981. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore cu fugiat nulla pariatur.", author: "abcdefghi", title: "123456")
    ])
}

extension Quote {
    static let sampleData: Quote = Quote(content: "First ring made of three interlaced individual bands. Lorem ipsum dolor sit amet, consectetur adipiscing clit.", author: "abcdefghi", title: "123456")
}
