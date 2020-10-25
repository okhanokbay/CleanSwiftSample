//
//  LocalProperties.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 25.10.2020.
//

import Foundation

public class LocalProperties {
  @UserDefaultsBacked(key: "username")
  static var username: String?
}
