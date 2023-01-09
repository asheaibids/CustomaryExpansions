//
//  UIViewControllerExtensions.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 09/01/2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addBackground(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(hex:"f2f2f2").cgColor, UIColor(hex:"f2f2f2").cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

    var previousViewController: UIViewController? {
        guard
            let viewControllers = navigationController?.viewControllers,
            let index = viewControllers.firstIndex(of: self),
            index > 0
        else { return nil }
        
        return viewControllers[index - 1]
    }

}
