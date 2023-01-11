//
//  UIViewExtensions.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 09/01/2023.
//

import Foundation
import UIKit

public extension UIView {
    
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: "linear")
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0]
        layer.add(animation, forKey: "shake")
    }
    
    func shakeLow(shouldShake: Bool = true) {
        if shouldShake {
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: "linear")
            animation.duration = 0.3
            animation.values = [-2.0, 2.0, -2.0, 2.0 ,-5.0, 5.0, 0.0]
            layer.add(animation, forKey: "shake")
        }
    }
    
    func refreshDisplay() {
        
        self.setNeedsDisplay()
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func getTitleView() -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let logo = UIImage(named: "logo")
        imageView.image = logo
        return imageView
    }
    
    
    func roundTop(radius:CGFloat = 5){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
    }
    
    func roundBottom(radius:CGFloat = 5){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
    }
    
    func rounde() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    func roundTwoCorners(radius:CGFloat = 20){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = (getLanguage() == Language.AR ? [.layerMaxXMinYCorner, .layerMinXMaxYCorner] : [.layerMaxXMaxYCorner, .layerMinXMinYCorner])
        } else {
            // Fallback on earlier versions
        }
    }
    
}

public extension UIView {

    func addRoundedEdges(round: CGFloat){
        self.layer.cornerRadius = round
    }
    
    func addRoundedBorder(roundedBorder: CGFloat = 8,
                          borderWidth: CGFloat = 1,
                          borderColor: CGColor = UIColor.black.cgColor) {
        
        self.layer.masksToBounds = false
        self.layer.cornerRadius = roundedBorder
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
    

}

/*----------Language----------*/
enum Language {
    static let EN = "en"
    static let FR = "fr"
    static let AR = "ar-LB"
    
    static let ENTitle = "EN"
    static let FRTitle = "FR"
    static let ARTitle = "AR"
}

func getLanguage() -> String {
    if (UserDefaults.standard.string(forKey: "lang") != nil)
    {
        return UserDefaults.standard.string(forKey: "lang")!
    }
    return Language.AR
}
