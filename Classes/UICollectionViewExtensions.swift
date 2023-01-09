//
//  UICollectionViewExtensions.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 09/01/2023.
//

import Foundation
import UIKit

extension UICollectionView {
    func setEmptyMessage(color: UIColor = .green, font: UIFont) {
        print("UIScreen.main.bounds.size.height = " , UIScreen.main.bounds.size.height) //667.0 -> ipad:iphone app // 896.0 -> XR  // 1024.0 - >ipad
        let messageLabel = UILabel(frame: CGRect(x: 300, y: 200, width: 30, height: 15))
        messageLabel.text = NSLocalizedString("no_data", comment: "")
        messageLabel.textColor = color
        messageLabel.backgroundColor = .clear // AppColors.grey
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = font
        //        messageLabel.sizeToFit()
        self.backgroundView = messageLabel;
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
