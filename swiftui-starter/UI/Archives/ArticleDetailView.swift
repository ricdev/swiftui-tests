//
//  ArticleView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/12/22.
//

import Combine
import SwiftUI

struct ArticleDetailView: View {
    @StateObject var viewModel: ArticleDetailViewModel

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

struct ArticleDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        let viewModel = ArticleDetailViewModel(title: "Article Detail Screen")
        ForEach(ColorScheme.allCases, id: \.self) {
            ArticleDetailView(viewModel: viewModel).preferredColorScheme($0)
        }
    }
}
