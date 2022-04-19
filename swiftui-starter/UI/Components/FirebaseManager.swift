//
//  FirebaseManager.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/6/22.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirebaseManager: NSObject {

    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    static let shared = FirebaseManager()

    override init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        super.init()
    }

    func fakeInit() {
        print("Initialized singleton")
    }
}