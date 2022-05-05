//
//  HasherAESGCM.swift
//  swiftui-starter
//
//  Created by Ricardo Monteverde on 4/6/22.
//

import CryptoKit
import Foundation

class HasherAESGCM {
    static let shared = HasherAESGCM()

    let protocolSalt = "Hashed user ID for Salt?".data(using: .utf8)!
    var symmetricKey: SymmetricKey?
    let nonce = AES.GCM.Nonce()

    init() {
        generateKeyViaSecret()
    }

    func generateKeyViaSecret() {
        let secret = "256-bit-key-secret-key-goes-here"
        symmetricKey = SymmetricKey(data: secret.data(using: .utf8)!)

        // Note: Customizing Nonce Sample
        // nonce = try! AES.GCM.Nonce(data: Data(base64Encoded: "fv1nixTVovpSvpdA")!)
    }

    // swiftlint:disable line_length
    func enryptString(_ value: String) -> Data? {
        guard let symmetricKey = symmetricKey else { return nil }
        // guard let nonce = self.nonce as? AES.GCM.Nonce else { return nil }

        // encrpt
        let valueToSecure = value.data(using: .utf8)!
        guard let encrypted = try? AES.GCM.seal(valueToSecure, using: symmetricKey, nonce: nonce).combined else { return nil }

        return encrypted
    }

    func decrypt(data: Data) -> Data? {
        guard let symmetricKey = symmetricKey else { return nil }
        // guard let nonce = self.nonce as? AES.GCM.Nonce else { return nil }

        // decrypt
        guard let sealedBox = try? AES.GCM.SealedBox(combined: data) else { return nil }
        guard let decrypted = try? AES.GCM.open(sealedBox, using: symmetricKey) else { return nil }

        return decrypted
    }

    func decrypt(data: Data) -> String? {
        guard let data: Data = decrypt(data: data) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
}
