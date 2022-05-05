//
//  LandingView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/5/22.
//

import SwiftUI

class LandingViewModel: ObservableObject {}

struct LandingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme

//    @ObservedObject var viewModel: LandingViewModel
//    @State private var currentTab = "Mail"

    init() {
        UITabBar.appearance().isHidden = false
    }

    var body: some View {
        GeometryReader { proxy in
            let bottomEdge = proxy.safeAreaInsets.bottom
            HomeView(bottomEdge: bottomEdge == 0 ? 15 : bottomEdge)
                .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            LandingView().preferredColorScheme($0)
        }
    }
}
