//
//  MessagesAPIResponse.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//

import Foundation

struct MessagesWrapper: Decodable {
  let messages: [Message]
}

struct Message: Decodable {
  let id: String
  let text: String
  let timestamp: TimeInterval
  let user: User
}

struct User: Decodable {
  let id: String
  let avatarURL: String?
  let nickname: String
}
