//
//  ResourceView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/12/22.
//

import Combine
import SwiftUI

struct ResourceView: View {

    @StateObject var viewModel: ResourceViewModel

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

struct ResourceViewPreviews: PreviewProvider {

    static var previews: some View {
        let viewModel: ResourceViewModel = ResourceViewModel(title: "Resource Screen")
        ForEach(ColorScheme.allCases, id: \.self) {
            ResourceView(viewModel: viewModel).preferredColorScheme($0)
        }
    }
}
