import UIKit
import Foundation
import SwiftUI

var greeting = "Hello, playground"


//struct Email {
//    private var string: String
//
//    init(_ string: String) throws {
//        try Validations.email(string)
//        self.string = string
//    }
//
//    func address() -> String {
//        return string
//    }
//}
//
//struct User {
//    let name: String
//    let email: Email
//}
//
//enum EvaluateError: Error {
//    case isEmpty
//    case isNotValidEmailAddress
//    case isNotValidEmailLength
//}
//
//struct Validations {
//    private static let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
//        + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
//        + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
//        + "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
//        + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
//        + "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
//        + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
//
//    static func email(_ string: String) throws {
//        if string.isEmpty == true {
//            throw EvaluateError.isEmpty
//        }
//
//        if isValid(input: string,
//                   regEx: emailRegEx,
//                   predicateFormat: "SELF MATCHES[c] %@") == false {
//            throw EvaluateError.isNotValidEmailAddress
//        }
//
//        if maxLength(emailAddress: string) == false {
//            throw EvaluateError.isNotValidEmailLength
//        }
//    }
//
//    // MARK: - Private
//    private static func isValid(input: String, regEx: String, predicateFormat: String) -> Bool {
//        return NSPredicate(format: predicateFormat, regEx).evaluate(with: input)
//    }
//
//    private static func maxLength(emailAddress: String) -> Bool {
//        // 64 chars before domain and total 80. '@' key is part of the domain.
//        guard emailAddress.count <= 80 else {
//            return false
//        }
//
//        guard let domainKey = emailAddress.firstIndex(of: "@") else { return false }
//
//        return emailAddress[..<domainKey].count <= 64
//    }
//}
//
//do {
//
//    let email = "aasdgmail.com"
//    try Email(email)
////    let validUser = User(name: "Darthpelo", email: Email(email).address())
//} catch {
//    print("Unexpected error: \(error).")
//}

//try {
//    let email = Email("aasd@gmail.com")
//    let validUser = User(name: "Darthpelo", email: email)
//} catch {
//
//}



//@propertyWrapper
//struct EmailValidated {
//    private(set) var defaultValue: String = ""
//
//    var wrappedValue: String {
//        get { defaultValue }
//        set { defaultValue = maxLength(newValue) && isValid(newValue) ? newValue : "" }
//    }
//
//    init(wrappedValue initialValue: String) {
//        self.wrappedValue = initialValue
//    }
//
//    private func isValid(emailAddress: String) -> Bool {
//        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
//            + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
//            + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
//            + "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
//            + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
//            + "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
//            + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
//
//        let emailValidation = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
//        return emailValidation.evaluate(with: emailAddress)
//    }
//
//    private func maxLength(_ emailAddress: String) -> Bool {
//        guard emailAddress.count <= 80 else {
//            return false
//        }
//
//        guard let domainKey = emailAddress.firstIndex(of: "@") else { return false }
//
//        return emailAddress[..<domainKey].count <= 64
//    }
//}
//
//struct User {
//    @EmailValidated var email: String
//    var name: String
//}
//
//let validUser = User(email: "aasd@gmail.com", name: "Darthpelo")
//let invalidUser = User(email: "sdf[]@gmail.com", name: "Darthpelo")
