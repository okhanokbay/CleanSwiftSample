//
//  Helper.swift
//  CleanSwiftSampleTests
//
//  Created by Okhan Okbay on 25.10.2020.
//

import Foundation

class TestHelper {
  static func loadJSONFromFile<T: Decodable>(name: String) -> T {
    let bundle = Bundle(for: Self.self)
    let path = bundle.path(forResource: name, ofType: "json")!
    let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
    return try! JSONDecoder().decode(T.self, from: data)
  }
}

extension FetchMessages.Response.InnerValue: Equatable {
  static func == (lhs: FetchMessages.Response.InnerValue, rhs: FetchMessages.Response.InnerValue) -> Bool {
    switch (lhs, rhs) {
    case (.success(let lhsMessages), .success(let rhsMessages)):
      return lhsMessages == rhsMessages
      
    case (.failure(let lhsErrorMessage), .failure(let rhsErrorMessage)):
      return lhsErrorMessage == rhsErrorMessage
      
    default:
      return false
    }
  }
}

extension Message: Equatable {
  static func == (lhs: Message, rhs: Message) -> Bool {
    return lhs.text == rhs.text
  }
}
