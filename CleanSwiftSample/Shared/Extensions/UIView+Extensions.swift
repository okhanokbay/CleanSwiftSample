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
