//
//  CustomView.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 09/01/2023.
//

import Foundation

open class CustomView: UIView {
    
    //MARK: - Shadow
    @IBInspectable var shadowColor: UIColor = UIColor(hex: "9397A0")
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0)
    @IBInspectable var shadowOpacity: Float = 0.3
    @IBInspectable var shadowRadius: CGFloat = 3.0

    @IBInspectable var shadowEnabled: Bool = false
    
    //MARK: - Border
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    //MARK: - Round Corner
    @IBInspectable var cornerValue: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadowEnabled == false {
                self.layer.masksToBounds = true
            }
        }
    }
    @IBInspectable var roundTopRight: Bool = false
    @IBInspectable var roundTopLeft: Bool = false
    @IBInspectable var roundBottomRight: Bool = false
    @IBInspectable var roundBottomLeft: Bool = false
    
    public override func awakeFromNib() {
        // Shadow
        if shadowEnabled {
            self.addShadow(shadowColor: self.shadowColor.cgColor, shadowOffset: self.shadowOffset, shadowOpacity: self.shadowOpacity, shadowRadius: self.shadowRadius)
        }
        
        // Specific round corners
        var rectCorners: CACornerMask = []
        if roundTopLeft {
            rectCorners.insert(.layerMinXMinYCorner)
        }
        if roundTopRight {
            rectCorners.insert(.layerMaxXMinYCorner)
        }
        if roundBottomLeft {
            rectCorners.insert(.layerMinXMaxYCorner)
        }
        if roundBottomRight {
            rectCorners.insert(.layerMaxXMaxYCorner)
        }
        if !rectCorners.isEmpty {
            self.roundCorners(corners: rectCorners)
        }
   
    }
    
    private func addShadow(shadowColor: CGColor,
                   shadowOffset: CGSize,
                   shadowOpacity: Float,
                   shadowRadius: CGFloat) {
        
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
    
    
    private func roundCorners(corners: CACornerMask) {
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [corners]
        } else {
            // Fallback on earlier versions
        }
    }
}
