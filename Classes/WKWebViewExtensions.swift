//
//  WKWebViewExtensions.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 09/01/2023.
//

import Foundation
import WebKit

public extension WKWebView {
    
    func loadingIndicator(_ show: Bool) {
        let tag = 808406
        
        DispatchQueue.main.async {
            if (self.viewWithTag(tag) == nil && show) {
                self.isUserInteractionEnabled = false
                self.alpha = 0.5
                
                let indicator = UIActivityIndicatorView()
                let buttonHeight = self.frame.size.height
                let buttonWidth = self.frame.size.width
                indicator.center = CGPoint(x: buttonWidth / 2, y: buttonHeight / 2)
                indicator.tag = tag
                
                if #available(iOS 13.0, *) {
                    indicator.activityIndicatorViewStyle = .large
                }
                
                self.addSubview(indicator)
                indicator.startAnimating()
            } else if(!show) {
                self.isUserInteractionEnabled = true
                self.alpha = 1.0
                
                if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                    indicator.stopAnimating()
                    indicator.removeFromSuperview()
                }
            }
        }
    }
}
