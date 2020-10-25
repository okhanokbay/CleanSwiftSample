//
//  MessagesInteractorTests.swift
//  CleanSwiftSampleTests
//
//  Created by Okhan Okbay on 25.10.2020.
//

@testable import CleanSwiftSample
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

// MARK: setupInitials(_:) tests

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
    XCTAssertEqual(mockPresenter.presentInitialsReceivedResponse?.title, username, "Title is not as expected")
  }
}

// MARK: fetchMessages(_:) tests

extension MessagesInteractorTests {
  func test_WhenFetchMessagesCalledAndReceivesSuccessResponse_ThenPresentMessagesCalled() {
    assert_WhenFetchMessagesCalled_ThenPresentMessagesCalled(isSuccessResponse: true)
  }
  
  func test_WhenFetchMessagesCalledAndReceivesFailureResponse_ThenPresentMessagesCalled() {
    assert_WhenFetchMessagesCalled_ThenPresentMessagesCalled(isSuccessResponse: false)
  }
  
  func assert_WhenFetchMessagesCalled_ThenPresentMessagesCalled(isSuccessResponse: Bool, file: StaticString = #file, line: UInt = #line) {
    // given
    let request = FetchMessages.Request()
    var expectedInnerValue: FetchMessages.Response.InnerValue
    
    if isSuccessResponse {
      let wrapper: MessagesWrapper = TestHelper.loadJSONFromFile(name: TestHelper.stubMessagesResponseFileName)
      expectedInnerValue = .success(wrapper.messages)
      
    } else {
      expectedInnerValue = .failure("Server error")
    }
    
    // when
    mockWorker.shouldReturnSuccess = isSuccessResponse
    sut.fetchMessages(request: request)
    
    // then
    XCTAssertEqual(mockPresenter.presentMessagesCallCount, 1, "Present messages is not called 1 time")
    XCTAssertEqual(mockPresenter.presentMessagesReceivedResponse?.innerValue, expectedInnerValue, "Inner value is not as expected")
  }
}

// MARK: sendMessage(_:) tests

extension MessagesInteractorTests {
  func test_WhenSendMessageCalledWithEmptyText_ThenPresentNewMessageNOTCalled() {
    // given
    let request = NewMessage.Request(text: nil)
    
    // when
    sut.sendMessage(request: request)
    
    // then
    XCTAssertEqual(mockPresenter.presentNewMessageCallCount, 0, "Present new message is called at least once")
    XCTAssertNil(mockPresenter.presentNewMessageReceivedResponse, "New message is not nil")
  }
  
  func test_WhenSendMessageCalledeWithNONEmptyText_ThenPresentNewMessageCalled() {
    // given
    let message = "New message text"
    let request = NewMessage.Request(text: message)
    let username = "TestUsername"
    
    // when
    mockDataStore.username = username
    sut.sendMessage(request: request)
    
    // then
    XCTAssertEqual(mockPresenter.presentNewMessageCallCount, 1, "Present new message is not called 1 time")
    XCTAssertEqual(mockPresenter.presentNewMessageReceivedResponse?.message, message, "Message is not as expected")
    XCTAssertEqual(mockPresenter.presentNewMessageReceivedResponse?.username, username, "Username is not as expected")
  }
}
