//
//  UIStackView+.swift
//  MatzipBook
//
//  Created by 심범수 on 6/16/25.
//

import UIKit

extension UIStackView {
    
    func configureStackView(
        axis: NSLayoutConstraint.Axis = .horizontal,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fillEqually,
        spacing: CGFloat = 0
    ) {
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
    }
}
