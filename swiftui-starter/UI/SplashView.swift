//
//  SplashView.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/14/22.
//

import Combine
import SwiftUI
import TTProgressHUD

// todo: Navigation Convertion
extension View {
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

class SplashViewModel: ObservableObject {

    @Published var title: String
    @Published var loading: Bool = false
    @Published var complete: Bool = false

    init(title: String) {
        self.title = title

        self.fetchData()
    }

    func setBindings() {
        $loading
            .map { $0 ? "Loading" : "Loaded" }
            .assign(to: &$title)
    }

    func fetchData() {
        Utils().delay(1) {
            self.loading = true
            Utils().delay(2) {
                self.loading = false
                self.complete = true
            }
        }
    }
}

// swiftlint:disable line_length
struct SplashView: View {

    @StateObject var viewModel: SplashViewModel

//    private var tapButton: some View {
//        Button(action: {
//            self.viewModel.fetchData()
//        }, label: { Text(L10n.General.Init.error) })
//    }

    private var titleView: some View {
        Text("Loading \(self.viewModel.title)")
    }

    var body: some View {
        NavigationView {
            ZStack {
//                NavigationLink(destination: IntroView(viewModel: IntroViewModel()), isActive: $viewModel.complete) {
//                    EmptyView()
//                }
                LottieView(name: "bg-dark", loopMode: .loop).edgesIgnoringSafeArea(.all)
                VStack {
                    titleView
                    // tapButton
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
