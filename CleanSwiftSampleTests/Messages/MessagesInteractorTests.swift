//
//  MessagesInteractorTests.swift
//  CleanSwiftSampleTests
//
//  Created by Okhan Okbay on 25.10.2020.
//

import XCTest

class MessagesInteractorTests: XCTestCase {
  
  var sut: MessagesInteractor!
  
  var mockDataStore: MockMessagesDataStore!
  var mockWorker: MockMessagesWorker!
  var mockPresenter: MockPresenter!
  
  override func setUpWithError() throws {
    sut = MessagesInteractor(dataStore: mockDataStore,
                             worker: mockWorker,
                             presenter: mockPresenter)
  }
}

