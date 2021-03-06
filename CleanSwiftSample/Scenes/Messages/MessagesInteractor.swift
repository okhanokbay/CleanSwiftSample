//
//  MessagesInteractor.swift
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

protocol MessagesBusinessLogic: AnyObject {
  func setupInitials(request: MessagesViewInitials.Request)
  func fetchMessages(request: FetchMessages.Request)
  func sendMessage(request: NewMessage.Request)
}

final class MessagesInteractor {
  
  let dataStore: MessagesDataStoreProtocol
  let worker: MessagesWorkerProtocol
  let presenter: MessagesPresentationLogic
  
  init(dataStore: MessagesDataStoreProtocol,
       worker: MessagesWorkerProtocol,
       presenter: MessagesPresentationLogic) {
   
    self.dataStore = dataStore
    self.worker = worker
    self.presenter = presenter
  }
}

extension MessagesInteractor: MessagesBusinessLogic {
  func setupInitials(request: MessagesViewInitials.Request) {
    let response = MessagesViewInitials.Response(title: dataStore.username ?? "")
    presenter.presentInitials(response: response)
  }
  
  func fetchMessages(request: FetchMessages.Request) {
    
    worker.fetchMessageHistory { [weak self] result in
      guard let self = self else { return }
      
      var innerValue: FetchMessages.Response.InnerValue
      
      switch result {
      case .success(let messages):
        innerValue = .success(messages)
        
      case .failure(let error):
        innerValue = .failure(error.customDescription)
      }
      
      let response = FetchMessages.Response(innerValue: innerValue)
      self.presenter.presentMessages(response: response)
    }
  }
  
  func sendMessage(request: NewMessage.Request) {
    if let text = request.text {
      let response = NewMessage.Response(message: text, username: dataStore.username ?? "")
      presenter.presentNewMessage(response: response)
    }
  }
}
