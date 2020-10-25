//
//  MessagesModels.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation


struct CellViewModel {
  let isOwnMessage: Bool
  let senderName: String
  let photoURL: URL?
  let messageContent: String
  let sentTime: String
  
  init(message: Message) {
    isOwnMessage = false
    senderName = message.user.nickname
    photoURL = URL(string: message.user.avatarURL ?? "")
    messageContent = message.text
    sentTime = message.timestamp.humanReadableDateTime
  }
  
  init(newMessage: NewMessage.Response) {
    isOwnMessage = true
    senderName = newMessage.username
    photoURL = URL(string: LocalProperties.profilePhotoURL)
    messageContent = newMessage.message
    sentTime = Date().timeIntervalSince1970.humanReadableDateTime
  }
}

enum FetchMessages {
  struct Request {}
  
  struct Response {
    enum InnerValue {
      case success([Message])
      case failure(String)
    }
    
    let innerValue: InnerValue
  }
  
  struct ViewModel {
    enum InnerValue {
      case success([CellViewModel])
      case failure(AlertViewModel)
    }
    
    let innerValue: InnerValue
  }
}

enum NewMessage {
  struct Request {
    let text: String?
  }
  
  struct Response {
    let message: String
    let username: String
  }
  
  struct ViewModel {
    let cellViewModels: [CellViewModel]
  }
}

enum MessagesViewInitials {
  struct Request {}
  struct Shared {
    let title: String
  }
  typealias Response = Shared
  typealias ViewModel = Shared
}
