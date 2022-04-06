//
//  SplashView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/14/22.
//

import Combine
import SwiftUI
import TTProgressHUD

struct SplashView: View {

    @StateObject var viewModel: SplashViewModel

    private var titleView: some View {
        Text("Loading \(self.viewModel.title)")
    }

    var body: some View {
        NavigationView {
            ZStack {
                LottieView(name: "bg-dark", loopMode: .loop).edgesIgnoringSafeArea(.all)
                VStack {
                    titleView
                }
                TTProgressHUD($viewModel.loading, config: TTProgressHUDConfig())
            }
        }.navigate(to: IntroView(viewModel: IntroViewModel()), when: $viewModel.complete)
    }
}

struct SplashViewPreviews: PreviewProvider {

    static var previews: some View {
        let splashViewModel: SplashViewModel = SplashViewModel(title: "Sample")
        SplashView(viewModel: splashViewModel)
    }
}
