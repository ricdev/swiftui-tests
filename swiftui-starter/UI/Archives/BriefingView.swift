//
//  BriefingView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/12/22.
//

import Combine
import SwiftUI

struct BriefingView: View {
    @StateObject var viewModel: BriefingViewModel

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

struct BriefingViewPreviews: PreviewProvider {
    static var previews: some View {
        let viewModel = BriefingViewModel(title: "Briefing Screen")
        ForEach(ColorScheme.allCases, id: \.self) {
            BriefingView(viewModel: viewModel).preferredColorScheme($0)
        }
    }
}
