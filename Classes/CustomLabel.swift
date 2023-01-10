//
//  CustomLabel.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 10/01/2023.
//

import Foundation

class CustomLabel: UILabel {
    
    @IBInspectable var key: String = "" {
        didSet {
            if key != "" {
                self.text = GlobalObjects.shared.getLocalize(key: key)
            }
        }
    }
    @IBInspectable var bold: Bool = false
    @IBInspectable var size: CGFloat = 13
    
    override func awakeFromNib() {
        self.font = bold ? GlobalObjects.shared.getBoldFont(size: size) : GlobalObjects.shared.getFont(size: size)
    }
}
