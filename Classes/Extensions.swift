//
//  Extensions.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 09/01/2023.
//

import Foundation
import UIKit
//testss

public extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

public extension Bundle {
    var getVersionNumber: Double? {
        let ver = infoDictionary?["CFBundleShortVersionString"] as? String
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = NSLocale(localeIdentifier: "EN") as Locale
        let number = numberFormatter.number(from: ver!)
        let verNb = number?.doubleValue
        return verNb
    }
    
    var appDisplayName: String {
        return (object(forInfoDictionaryKey: "CFBundleDisplayName") as? String) ?? ""
    }
    
    var getBuildNumber: Double? {
        let ver = infoDictionary?["CFBundleVersion"] as? String
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en")
        let number = numberFormatter.number(from: ver!)
        let verNb = number?.doubleValue
        return verNb
    }
}

public extension Date {
    var ticks: String {
        return String(UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000))
    }
    
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func toDateString(dateFormat format  : String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
         return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
     }
}


public extension String {

    func isArabic() -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "(?s).*\\p{Arabic}.*")
        return predicate.evaluate(with: self)
    }
    
    func hashtags() -> [String] {
        if let regex = try? NSRegularExpression(pattern: "#[a-z0-9]+", options: .caseInsensitive){
            let string = self as NSString
            
            return regex.matches(in: self, options: [], range: NSRange(location: 0, length: string.length)).map {
                string.substring(with: $0.range).replacingOccurrences(of: "#", with: "").lowercased()
            }
        }
        return []
    }
    
    func getYoutubeId() -> String {
        return URLComponents(string: self)?.queryItems?.first(where: { $0.name == "v" })?.value ?? ""
    }
    
    var youtubeID: String? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"
        
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: count)
        
        guard let result = regex?.firstMatch(in: self, range: range) else {
            return nil
        }
        return (self as NSString).substring(with: result.range)
    }
    
     var arToEnDigits : String {
        let arabicNumbers = ["،": ",", "٠": "0","١": "1","٢": "2","٣": "3","٤": "4","٥": "5","٦": "6","٧": "7","٨": "8","٩": "9"]
        var txt = self
        _=arabicNumbers.map { txt = txt.replacingOccurrences(of: $0, with: $1)}
        return txt
    }
    
    func numberOnly() -> String {
        var txt = ""
        for ss in Array(self){
            switch ss {
            case "0","1","2","3","4","5","6","7","8","9","١","٢","٣","٤","٥","٦","٧","٨","٩","٠" : txt += String(ss)
            default :
                break
            }
        }
        return txt.arToEnDigits
    }
    
}



public extension UIFont {
    var bold: UIFont {
        return with(traits: .traitBold)
    } // bold
    
    var italic: UIFont {
        return with(traits: .traitItalic)
    } // italic
    
    var boldItalic: UIFont {
        return with(traits: [.traitBold, .traitItalic])
    } // boldItalic
    
    
    func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(traits) else {
            return self
        } // guard
        
        return UIFont(descriptor: descriptor, size: 0)
    } // with(traits:)
} // extension

public extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en")
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}

public extension Double {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en")
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}


public extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: label.frame.size) //CGSize.zero
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.calculateMaxLines()
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        print("label numberOfLines =" , label.numberOfLines)
        print("label calculateMaxLines =" , label.calculateMaxLines())
        
        ///*
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        //CGPointMake((labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x , (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        //CGPointMake(locationOfTouchInLabel.x - textContainerOffset.x, locationOfTouchInLabel.y - textContainerOffset.y);
        
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        print("indexOfCharacter: " , indexOfCharacter)
        return NSLocationInRange(indexOfCharacter, targetRange)
        //*/
        
        
        /*
         // Begin computation of actual frame
         // Glyph is the final display representation
         var glyphRange = NSRange()
         // Extract the glyph range
         layoutManager.characterRangeForGlyphRange(moreStringRange!, actualGlyphRange: &glyphRange)
         
         // Compute the rect of glyph in the text container
         print("glyphRange\(glyphRange)")
         print("textContainer\(textContainer)")
         let glyphRect:CGRect = layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
         
         // Final rect relative to the textLabel.
         print("\(glyphRect)")
         
         // Now figure out if the touch point is inside our rect
         let touchPoint:CGPoint = tapRec.locationOfTouch(0, inView: label)
         
         if glyphRect.contains(touchPoint) {
         print("User tapped on Read More. So show something more")
         return true
         }
         return false*/
    }
}

public extension Double {
    func getNoDecimal() -> String {
        if Double(Int(self)) == self {
            return String(Int(self))
        }
        else {
            return String(format: "%0.1f", self)
        }
    }
}

public extension TimeInterval {
    private var milliseconds: Int {
        return Int((truncatingRemainder(dividingBy: 1)) * 1000)
    }

    private var seconds: Int {
        return Int(self) % 60
    }

    private var minutes: Int {
        return (Int(self) / 60 ) % 60
    }

     var hours: Int {
        return Int(self) / 3600
    }

    var stringTime: String {
        if hours != 0 {
            return "\(hours) hours"
        } else if minutes != 0 {
            return "\(minutes) minutes"
        } else if milliseconds != 0 {
            return "\(seconds) milliseconds"
        } else {
            return "\(seconds) seconds"
        }
    }
}
