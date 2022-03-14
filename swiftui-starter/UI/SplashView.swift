//
//  SplashView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/14/22.
//

import Combine
import SwiftUI
import TTProgressHUD

class SplashViewModel: ObservableObject {
    
    @Published var title: String
    @Published var loading: Bool = false
    
    init(title: String) {
        self.title = title
    }
    
    func setBindings() {
        $loading
            .map { $0 ? "Loading" : "Loaded" }
            .assign(to: &$title)
    }
    
    func fetchData() {
        self.loading = true
        Utils().delay(2) {
            self.loading = false
        }
    }
}

struct SplashView: View {
    
    @StateObject var viewModel: SplashViewModel
    
    private var tapButton: some View {
        Button(action: {
            self.viewModel.fetchData()
        }, label: { Text("Submit") })
    }
    
    private var titleView: some View {
        Text("Title: \(self.viewModel.title)")
    }
    
    var body: some View {
        ZStack {
            LottieView(name: "bg-dark", loopMode: .loop).edgesIgnoringSafeArea(.all)
            VStack {
                titleView
                tapButton
            }
            TTProgressHUD($viewModel.loading, config: TTProgressHUDConfig())
        }
    }
}

struct SplashViewPreviews: PreviewProvider {
    
    static var previews: some View {
        let splashViewModel: SplashViewModel = SplashViewModel(title: "Sample")
        SplashView(viewModel: splashViewModel)
    }
}
