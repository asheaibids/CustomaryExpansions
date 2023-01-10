//
//  GlobalObjects.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 10/01/2023.
//

import Foundation

public class GlobalObjects {
    
    public static let shared = GlobalObjects()
    
    public var podLocalizeDictionary: LocalizeDictionary?
    
    public var regularFontName: String?
    public var regularArabicFontName: String?
    
    public var semiBoldFontName: String?
    public var semiBoldArabicFontName: String?

    public var boldFontName: String?
    public var boldArabicFontName: String?
    
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
            return UIFont(name: GlobalObjects.shared.regularArabicFontName ?? "", size: size - 1)!
        } else {
            return UIFont(name: GlobalObjects.shared.regularFontName ?? "", size: size)!
        }
    }
    
    func getSemiBoldFont(size: CGFloat) -> UIFont {
        if(getLanguage() == Language.AR) {
            return UIFont(name: GlobalObjects.shared.semiBoldArabicFontName ?? "", size: size - 1)!
        } else {
            return UIFont(name: GlobalObjects.shared.semiBoldFontName ?? "", size: size)!
        }
    }

    func getBoldFont(size: CGFloat) -> UIFont {
        if(getLanguage() == Language.AR) {
            return UIFont(name: GlobalObjects.shared.boldArabicFontName ?? "", size: size - 1)!
        } else {
            return UIFont(name: GlobalObjects.shared.boldFontName ?? "", size: size)!
        }
    }
}

// classes and functions for LocalizeDictionary

public typealias LocalizeDictionary = [String:LocalizeObject]

public class LocalizeObject : Codable {
    public var key: String
    public var messageAr: String
    public  var messageEn: String

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
