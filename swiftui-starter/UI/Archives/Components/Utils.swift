//
//  Utils.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 3/12/22.
//

import Foundation

struct Utils {
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.usesGroupingSeparator = true
        return formatter
    }()

    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM, HH:mm"
        return formatter
    }()

    func delay(_ delay: Double, closure: @escaping () -> Void) {
        // swiftlint:disable line_length
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure
        )
    }
}
