//
//  UIView+Extensions.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 25.10.2020.
//

import UIKit

extension UIView {
  class func loadFromNib() -> Self {
        return Bundle(for: Self.self).loadNibNamed(String(describing: Self.self), owner: nil, options: nil)![0] as! Self
    }
}

extension UIView {
@discardableResult func addRightBorder(color: UIColor, width: CGFloat) -> UIView {
    let layer = CALayer()
    layer.borderColor = color.cgColor
    layer.borderWidth = width
    layer.frame = CGRect(x: self.frame.size.width-width, y: 0, width: width, height: self.frame.size.height)
    self.layer.addSublayer(layer)
    return self
    }
@discardableResult func addLeftBorder(color: UIColor, width: CGFloat) -> UIView {
    let layer = CALayer()
    layer.borderColor = color.cgColor
    layer.borderWidth = width
    layer.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
    self.layer.addSublayer(layer)
    return self
    }
@discardableResult func addTopBorder(color: UIColor, width: CGFloat) -> UIView {
    let layer = CALayer()
    layer.borderColor = color.cgColor
    layer.borderWidth = width
    layer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
    self.layer.addSublayer(layer)
    return self
    }
@discardableResult func addBottomBorder(color: UIColor, width: CGFloat) -> UIView {
    let layer = CALayer()
    layer.borderColor = color.cgColor
    layer.borderWidth = width
    layer.frame = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: width)
    self.layer.addSublayer(layer)
    return self
    }
}
