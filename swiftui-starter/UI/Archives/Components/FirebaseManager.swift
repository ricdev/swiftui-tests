//
//  FirebaseManager.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/6/22.
//

import Firebase
import FirebaseFirestore
import Foundation

class FirebaseManager: NSObject {
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    static let shared = FirebaseManager()

    override init() {
        FirebaseApp.configure()
        auth = Auth.auth()
        storage = Storage.storage()
        firestore = Firestore.firestore()
        super.init()
    }

    func fakeInit() {
        print("Initialized singleton")
    }
}
