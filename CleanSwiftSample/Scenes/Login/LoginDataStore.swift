//
//  LoginDataStore.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//

import Foundation

protocol LoginDataStoreProtocol: AnyObject {
  var username: String! { get set }
}

final class LoginDataStore: LoginDataStoreProtocol {
  var username: String!
}
