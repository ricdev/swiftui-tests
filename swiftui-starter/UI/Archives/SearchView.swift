//
//  SearchView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/12/22.
//

import Combine
import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel

    private var titleView: some View {
        Text("\(self.viewModel.title)")
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    titleView
                }
            }
        }
    }
}

struct SearchViewPreviews: PreviewProvider {
    static var previews: some View {
        let viewModel = SearchViewModel(title: "Search Screen")
        ForEach(ColorScheme.allCases, id: \.self) {
            SearchView(viewModel: viewModel).preferredColorScheme($0)
        }
    }
}
