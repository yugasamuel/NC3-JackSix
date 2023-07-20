import Foundation
import CommonCrypto
import CryptoKit

func generateSymmetricKey(fromString stringKey: String) throws -> SymmetricKey {
    guard let keyData = stringKey.data(using: .utf8) else {
        throw NSError(domain: "InvalidKey", code: -1, userInfo: nil)
    }
    
    let hashedKey = SHA256.hash(data: keyData)
    
    let symmetricKey = SymmetricKey(data: hashedKey)
    
    return symmetricKey
}

func encryptData(stringMessage: String, key: SymmetricKey) throws -> String {
    let messageData = stringMessage.data(using: .utf8)!
    let sealedBox = try AES.GCM.seal(messageData, using: key)
    let sealedBoxData = sealedBox.combined!
    let sealedBoxBaseString = sealedBoxData.base64EncodedString()
    return sealedBoxBaseString
}

func decryptData(sealedBoxBaseString: String, key: SymmetricKey) throws -> String {
    guard let sealedBoxData = Data(base64Encoded: sealedBoxBaseString) else {
        throw NSError(domain: "InvalidBase64String", code: -1, userInfo: nil)
    }
    let sealedBox = try AES.GCM.SealedBox(combined: sealedBoxData)
    let decryptedData = try AES.GCM.open(sealedBox, using: key)
    guard let decryptedString = String(data: decryptedData, encoding: .utf8) else {
        throw NSError(domain: "DecryptionError", code: -1, userInfo: nil)
    }
    
    return decryptedString
}

