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
    mockDataStore = MockMessagesDataStore()
    mockWorker = MockMessagesWorker()
    mockPresenter = MockPresenter()
    
    sut = MessagesInteractor(dataStore: mockDataStore,
                             worker: mockWorker,
                             presenter: mockPresenter)
  }
}

extension MessagesInteractorTests {
  func test_WhenSetupInitialsCalled_ThenPresentInitialsCalled() {
    // given
    let request = MessagesViewInitials.Request()
    let username = "TestUsername"
    
    // when
    mockDataStore.username = username
    sut.setupInitials(request: request)
    
    // then
    XCTAssertEqual(mockPresenter.presentInitialsCallCount, 1, "Present initials is not called 1 time")
    XCTAssertEqual(mockPresenter.presentInitialsReceivedResponse?.title, username, "Received response's title is not as expected")
  }
}

