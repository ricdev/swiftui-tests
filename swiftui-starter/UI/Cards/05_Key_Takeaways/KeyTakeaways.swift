//
//  KeyTakeaways.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/27/22.
//

import Foundation

struct KeyTakeaways: Identifiable {
    var id: UUID
    var contents: [KeyTakeaway]

    init(id: UUID = UUID(), contents: [KeyTakeaway]) {
        self.id = id
        self.contents = contents
    }
}

struct KeyTakeaway: Identifiable {
    var id: UUID
    var content: String

    init(id: UUID = UUID(), content: String) {
        self.id = id
        self.content = content
    }
}

// swiftlint:disable line_length
extension KeyTakeaways {
    static let sampleData: KeyTakeaways = KeyTakeaways(contents: [
        KeyTakeaway(content: "First ring made of three interlaced individual bands. Lorem ipsum dolor sit amet, consectetur adipiscing clit."),
        KeyTakeaway(content: "The harmonious interplay betweenthe bands create an expression of attachment. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex."),
        KeyTakeaway(content: "Relaunched by Cartier in 1981. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore cu fugiat nulla pariatur.")
    ])
}

extension KeyTakeaway {
    static let sampleData: KeyTakeaway = KeyTakeaway(content: "First ring made of three interlaced individual bands. Lorem ipsum dolor sit amet, consectetur adipiscing clit. The harmonious interplay between the bands create an expression of attachment. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut ex.")
}
