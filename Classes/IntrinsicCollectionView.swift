//
//  IntrinsicCollectionView.swift
//  customaryExpansions
//
//  Created by IDS MBPR 2015 on 03/01/2023.
//

import Foundation
import UIKit

//When something changes in your custom view that invalidates its intrinsic content size. This allows the constraint-based layout system to take the new intrinsic content size into account in its next layout pass.

open class IntrinsicHorizontalCollectionView: UICollectionView {

    open override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    open override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: contentSize.width , height: UIViewNoIntrinsicMetric)
    }

}
open class IntrinsicVerticalCollectionView: UICollectionView {

    open override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    open override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: contentSize.height)
    }

}

