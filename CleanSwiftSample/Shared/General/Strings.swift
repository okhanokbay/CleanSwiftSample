//
//  Strings.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//

import Foundation

enum Strings {
  static let error = "Error"
  static let confirm = "OK"
  
  static let usernamePlaceholder = "Username"
  static var usernameCharacterLength: String { "Username must be longer than \(ValidationRules.usernameMinCharLength) characters" }
  
  static let leave = "Leave"
}
