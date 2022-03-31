//
//  StylesView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/30/22.
//

import SwiftUI

struct StylesView: View {

    var body: some View {
        VStack {

        }
    }
}

struct StylesView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            HStack {
                StylesView()
            }.preferredColorScheme($0)
        }
    }
}
