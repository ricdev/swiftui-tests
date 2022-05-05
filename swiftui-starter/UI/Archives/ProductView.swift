//
//  ProductView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/12/22.
//

import Combine
import SwiftUI

struct ProductView: View {
    @StateObject var viewModel: ProductViewModel

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

struct ProductViewPreviews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProductViewModel(title: "Product Screen")
        ForEach(ColorScheme.allCases, id: \.self) {
            ProductView(viewModel: viewModel).preferredColorScheme($0)
        }
    }
}
