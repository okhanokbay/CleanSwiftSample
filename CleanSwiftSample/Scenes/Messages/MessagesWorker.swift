//
//  MessagesWorker.swift
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
import Moya

enum MessageAPIError: Error {
  case decodingError(customDescription: String)
  case serverError(customDescription: String)
  
  var customDescription: String {
    switch self {
    case .decodingError(let customDescription), .serverError(let customDescription):
      return customDescription
    }
  }
}

protocol MessagesWorkerProtocol: AnyObject {
  func fetchMessageHistory(completion: @escaping (Result<[Message], MessageAPIError>) -> Void)
}

final class MessagesWorker: MessagesWorkerProtocol {
  private let messagesAPI: MoyaProvider<MessagesEndpoint> = .init()
  
  func fetchMessageHistory(completion: @escaping (Result<[Message], MessageAPIError>) -> Void) {
    
    messagesAPI.request(.init()) { result in
      switch result {
      case .success(let response):
        
        do {
          let wrapper = try JSONDecoder().decode(MessagesWrapper.self, from: response.data)
          completion(.success(wrapper.messages))
          
        } catch {
          completion(.failure(.decodingError(customDescription: error.localizedDescription)))
        }
        
      case .failure(let error):
        completion(.failure(.serverError(customDescription: error.localizedDescription)))
      }
    }
  }
}
