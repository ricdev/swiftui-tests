//
//  FTUEView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/12/22.
//

import Combine
import SwiftUI

struct FTUEView: View {
    @StateObject var viewModel: FTUEViewModel

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

struct FTUEViewPreviews: PreviewProvider {
    static var previews: some View {
        let viewModel = FTUEViewModel(title: "FTUE Screen")
        ForEach(ColorScheme.allCases, id: \.self) {
            FTUEView(viewModel: viewModel).preferredColorScheme($0)
        }
    }
}
