//
//  Helper.swift
//  CleanSwiftSampleTests
//
//  Created by Okhan Okbay on 25.10.2020.
//

import Foundation

class TestHelper {
  static let stubMessagesResponseFileName = "MessagesStubResponse"
  
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

extension FetchMessages.ViewModel.InnerValue: Equatable {
  static func == (lhs: FetchMessages.ViewModel.InnerValue, rhs: FetchMessages.ViewModel.InnerValue) -> Bool {
    switch (lhs, rhs) {
    case (.success(let lhsViewModels), .success(let rhsViewModels)):
      return lhsViewModels == rhsViewModels
      
    case (.failure(let lhsAlertViewModel), .failure(let rhsAlertViewModel)):
      return lhsAlertViewModel == rhsAlertViewModel
      
    default:
      return false
    }
  }
}

extension CellViewModel: Equatable {
  static func == (lhs: CellViewModel, rhs: CellViewModel) -> Bool {
    return lhs.isOwnMessage == rhs.isOwnMessage &&
      lhs.messageContent == rhs.messageContent &&
      lhs.photoURL == rhs.photoURL &&
      lhs.senderName == rhs.senderName &&
      lhs.sentTime == rhs.sentTime
  }
}

extension AlertViewModel: Equatable {
  static func == (lhs: AlertViewModel, rhs: AlertViewModel) -> Bool {
    return lhs.title == rhs.title &&
      lhs.message == rhs.message &&
      lhs.buttonText == rhs.buttonText
  }
}
