//
//  MessagesDataStore.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//

import Foundation

protocol MessagesDataStoreProtocol: AnyObject {
  var username: String? { get set }
}

final class MessagesDataStore: MessagesDataStoreProtocol {
  var username: String?
}
