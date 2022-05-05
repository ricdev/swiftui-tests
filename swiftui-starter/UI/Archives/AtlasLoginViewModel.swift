//
//  AtlasLoginViewModel.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/6/22.
//

import Foundation

class AtlasLoginViewModel: ObservableObject {
    enum LoginTypes: String {
        case atlas
        case faceTouch
    }

    @Published var selectedLoginType: LoginTypes?

    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""

    func setLoginOption(selectedLoginType: LoginTypes) {
        self.selectedLoginType = selectedLoginType
        print("selected: ", selectedLoginType)
    }

    func isPasswordValid() -> Bool {
        // criteria in regex.  See http://regexlib.com
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
        return passwordTest.evaluate(with: password)
    }

    // swiftlint:disable line_length
    func isEmailValid() -> Bool {
        // criteria in regex.  See http://regexlib.com
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }

    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else {
            return "Enter a valid email address"
        }
    }

    var confirmPasswordPrompt: String {
        if passwordsMatch() {
            return ""
        } else {
            return "Password fields do not match"
        }
    }

    func passwordsMatch() -> Bool {
        password == confirmPassword
    }

    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else {
            return "Must be between 8 and 15 characters containing at least one number and one capital letter"
        }
    }

    var isSignUpFormComplete: Bool {
        if !isPasswordValid() ||
            !isEmailValid()
        {
            return false
        }
        return true
    }

    var isLoginFormComplete: Bool {
        if !isPasswordValid() ||
            !isEmailValid()
        {
            return false
        }
        return true
    }
}
