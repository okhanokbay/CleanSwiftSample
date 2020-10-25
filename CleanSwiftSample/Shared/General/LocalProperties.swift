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
  
  @UserDefaultsBacked(key: "profilePhotoURL", defaultValue: "https://avatars3.githubusercontent.com/u/7668886?s=460&u=db80d7ed5b35f9a29ae4c45ab4e5ad7a1ba31ea1&v=4")
  static var profilePhotoURL: String
}
