//
//  UIColor+Extensions.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/6/22.
//

import UIKit

// We Are extending some additional functionalities for converting RGB values into new custom colors
extension UIColor {

    convenience init(r: Int, g:Int , b:Int) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
    }

    class var deepNavy: UIColor {
        return UIColor(r: 21, g: 50, b: 67)
    }

    class var altDeepNavy: UIColor {
        return UIColor(r: 40, g: 75, b: 99)
    }

    class var ashGray: UIColor {
        return UIColor(r: 180, g: 184, b: 171)
    }

    class var ivory: UIColor {
        return UIColor(r: 244, g: 249, b: 233)
    }

    class var alabaster: UIColor {
        return UIColor(r: 238, g: 240, b: 235)
    }
}
