//
//  GlobalObjects.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 10/01/2023.
//

import Foundation

class GlobalObjects {
    
    public static let shared = GlobalObjects()
    
    public var podLocalizeDictionary: LocalizeDictionary?
    
    public var podFontName: String?
    public var podBoldFontName: String?
    public var podArabicFontName: String?
    
    func getLocalize(key: String) -> String {
        if let item = GlobalObjects.shared.podLocalizeDictionary?[key] {
            return UIApplication.isRTL() ? item.messageAr : item.messageEn
        }
        else {
            print("get Localize key error: \(key.isEmpty ? "- -" : key) -- NSLocalizedString: \(NSLocalizedString(key, comment: ""))")
            return NSLocalizedString(key, comment: "")
        }
    }
    
    func getFont(size: CGFloat) -> UIFont {
        if(getLanguage() == Language.AR) {
            return UIFont(name: GlobalObjects.shared.podFontName ?? "", size: size - 1)!
        } else {
            return UIFont(name: GlobalObjects.shared.podFontName ?? "", size: size)!
        }
    }

    func getBoldFont(size: CGFloat) -> UIFont {
        if(getLanguage() == Language.AR) {
            return UIFont(name: GlobalObjects.shared.podArabicFontName ?? "", size: size - 1)!
        } else {
            return UIFont(name: GlobalObjects.shared.podBoldFontName ?? "", size: size)!
        }
    }
    
}

// classes and functions for LocalizeDictionary

public typealias LocalizeDictionary = [String:LocalizeObject]

public class LocalizeObject : Codable {
    var key: String
    var messageAr: String
    var messageEn: String

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case messageAr = "valueAr"
        case messageEn = "valueEn"
    }

    init(key: String, messageAr: String, messageEn: String) {
        self.key = key
        self.messageAr = messageAr
        self.messageEn = messageEn
    }
}
extension UIApplication {
    class func isRTL() -> Bool {
        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    }
}
