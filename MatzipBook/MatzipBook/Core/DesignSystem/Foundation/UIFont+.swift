//
//  UIFont+.swift
//  MatzipBook
//
//  Created by 심범수 on 6/15/25.
//

import UIKit

enum FontName: String {
    case bold = "Pretendard-Bold"
    case regular = "Pretendard-Regular"
}

extension UIFont {
    
    static func applyFont(_ name: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: name.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
