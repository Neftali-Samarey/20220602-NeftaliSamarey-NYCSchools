//
//  UIColor+Extensions.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/6/22.
//

import UIKit

extension UIColor {

    convenience init(r: Int, g:Int , b:Int) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
    }

    class var warmBlue: UIColor {
        return UIColor(r: 255, g: 109, b: 109)
    }
}
