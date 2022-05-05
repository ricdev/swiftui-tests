//
//  ResourceViewModel.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/12/22.
//

import Foundation

class ResourceViewModel: ObservableObject {
    @Published var title: String
    @Published var loading: Bool = false
    @Published var complete: Bool = false

    init(title: String) {
        self.title = title
    }
}
