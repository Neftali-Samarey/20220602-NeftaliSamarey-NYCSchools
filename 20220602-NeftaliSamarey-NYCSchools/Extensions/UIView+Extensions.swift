//
//  UIView+Extensions.swift
//  20220602-NeftaliSamarey-NYCSchools
//
//  Created by Neftali Samarey on 6/7/22.
//

import UIKit

// We are extending UIView to support of corner rounding on the slider view
extension UIView {

    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()

        mask.path = path.cgPath
        layer.mask = mask
    }
}
