//
//  UITextField+UITextView Extensions.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 09/01/2023.
//

import Foundation
import UIKit
//test

public extension UITextField {
     var substituteFontName: String {
        get {
            return self.font?.fontName ?? ""
        }
        set {
            self.font = UIFont(name: newValue, size: self.font?.pointSize ?? 17)
        }
    }
    
    func setAttributedPlaceholder(txt: String , color : UIColor){
        self.attributedPlaceholder = NSAttributedString(string: txt, attributes: [NSAttributedString.Key.foregroundColor: color])
    }
}

public extension UITextView {
     var substituteFontName: String {
        get {
            return self.font?.fontName ?? ""
        }
        set {
            self.font = UIFont(name: newValue, size: self.font?.pointSize ?? 17)
        }
    }
}
