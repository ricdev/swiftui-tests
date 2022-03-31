//
//  AccordionView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/29/22.
//

import SwiftUI

// swiftlint:disable line_length
struct AccordionListItem: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [AccordionListItem]?

    static let facebook = AccordionListItem(name: "Facebook", icon: "1.circle")
    static let twitter = AccordionListItem(name: "Twitter", icon: "square.and.pencil")
    static let instagram = AccordionListItem(name: "Instagram", icon: "bolt.fill")

    static let example1 = AccordionListItem(name: "Favorites", icon: "star", items: [AccordionListItem.facebook, AccordionListItem.twitter, AccordionListItem.instagram])
    static let example2 = AccordionListItem(name: "Recent", icon: "timer", items: [AccordionListItem.facebook, AccordionListItem.twitter, AccordionListItem.instagram])
    static let example3 = AccordionListItem(name: "Recommended", icon: "hand.thumbsup", items: [AccordionListItem.facebook, AccordionListItem.twitter, AccordionListItem.instagram])
}

struct AccordionView: View {
    let items: [AccordionListItem] = [.example1, .example2, .example3]

    var body: some View {
        List(items, children: \.items) { row in
            Image(systemName: row.icon)
            Text(row.name)
        }
    }
}

struct AccordionView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            HStack {
                AccordionView()
            }.padding().preferredColorScheme($0)
        }
    }
}
