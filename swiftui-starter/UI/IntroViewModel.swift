//
//  IntroViewModel.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/6/22.
//

import Foundation

class IntroViewModel: ObservableObject {

    enum LoginTypes: String {
        case atlas
        case faceTouch
    }

    @Published var selectedLoginType: LoginTypes?

    func setLoginOption(selectedLoginType: LoginTypes) {
        self.selectedLoginType = selectedLoginType
        print("selected: ", selectedLoginType)
    }
}
