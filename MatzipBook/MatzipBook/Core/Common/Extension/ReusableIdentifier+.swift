//
//  ReusableIdentifier+.swift
//  MatzipBook
//
//  Created by 심범수 on 6/16/25.
//

import UIKit

protocol ReusableIdentifier: AnyObject {}

extension ReusableIdentifier where Self: UIView {

    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReusableIdentifier {}
