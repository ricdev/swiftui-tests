//
//  SplashViewModel.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/6/22.
//

import Foundation

class SplashViewModel: ObservableObject {
    @Published var title: String
    @Published var loading: Bool = false
    @Published var complete: Bool = false

    init(title: String) {
        self.title = title

        fetchData()
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
