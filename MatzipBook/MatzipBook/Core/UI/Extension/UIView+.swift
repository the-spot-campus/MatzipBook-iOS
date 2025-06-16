//
//  UIView+.swift
//  MatzipBook
//
//  Created by 심범수 on 6/10/25.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
