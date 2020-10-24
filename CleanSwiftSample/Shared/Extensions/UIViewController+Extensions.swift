//
//  UIViewController+Extensions.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
