//
//  UIColor+.swift
//  MatzipBook
//
//  Created by RAFA on 5/30/25.
//

import UIKit

extension UIColor {

    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let scanner: Scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var hexNumber: UInt64 = 0
        scanner.scanHexInt64(&hexNumber)

        let red: CGFloat = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
        let blue: CGFloat = CGFloat(hexNumber & 0x0000FF) / 255.0
        let alpha: CGFloat = hex.count > 7
        ? CGFloat((hexNumber & 0xFF000000) >> 24) / 255.0
        : alpha

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    static let mainBackgroundColor: UIColor = UIColor(hex: "FAFAFA")
    static let shadowColor: UIColor = UIColor(hex: "000000", alpha: 0.13)
}
