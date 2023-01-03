//
//  IntrinsicTableView.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 03/01/2023.
//

import Foundation
import UIKit

//When something changes in your custom view that invalidates its intrinsic content size. This allows the constraint-based layout system to take the new intrinsic content size into account in its next layout pass.

class IntrinsicTableView: UITableView {

    override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: contentSize.height)
    }

}
