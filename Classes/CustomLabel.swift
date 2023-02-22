//
//  CustomLabel.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 10/01/2023.
//

import Foundation

open class CustomLabel: UILabel {
    
    @IBInspectable var key: String = "" {
        didSet {
            if key != "" {
                self.text = GlobalObjects.shared.getLocalize(key: key)
            }
        }
    }
    @IBInspectable var bold: Bool = false
    @IBInspectable var semiBold: Bool = false
    @IBInspectable var size: CGFloat = 13
    
    public override func awakeFromNib() {
        self.font = bold ? GlobalObjects.shared.getBoldFont(size: size) : semiBold ? GlobalObjects.shared.getSemiBoldFont(size: size) : GlobalObjects.shared.getFont(size: size)
    }
}
