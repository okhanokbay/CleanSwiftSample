//
//  MessagesPresenterTests.swift
//  CleanSwiftSampleTests
//
//  Created by Okhan Okbay on 25.10.2020.
//

@testable import CleanSwiftSample
import XCTest

class MessagesPresenterTests: XCTestCase {
  
  var sut: MessagesPresenter!
  var mockDisplayer: MockDisplayer!
  
  override func setUpWithError() throws {
    mockDisplayer = MockDisplayer()
    sut = MessagesPresenter(displayer: mockDisplayer)
  }
}

// MARK: presentInitials(_:) tests

extension MessagesPresenterTests {
  func test_WhenPresentInitialsCalled_ThenDisplayInitialsCalled() {
    // given
    let title = "Test title"
    let response = MessagesViewInitials.Response(title: title)
    
    // when
    sut.presentInitials(response: response)
    
    // then
    XCTAssertEqual(mockDisplayer.displayInitialsCallCount, 1, "Display initials is not called 1 time")
    XCTAssertEqual(mockDisplayer.displayInitialsReceivedViewModel?.title, title, "Title is not as expected")
  }
}

// MARK: presentMessages(_:) tests

extension MessagesPresenterTests {
  func test_WhenPresentMessagesCalledWithSuccessResponse_ThenDisplayMessagesCalledWithCorrectViewModel() {
    // given
    let wrapper: MessagesWrapper = TestHelper.loadJSONFromFile(name: TestHelper.stubMessagesResponseFileName)
    let response = FetchMessages.Response(innerValue: .success(wrapper.messages))
    
    let expectedCellViewModels = wrapper.messages.map(CellViewModel.init)
    let expectedViewModel = FetchMessages.ViewModel(innerValue: .success(expectedCellViewModels))
    
    // when - then
    assertPresentMessagesCall(response: response, expectedViewModel: expectedViewModel, expectedCellViewModels: expectedCellViewModels)
  }
  
  func test_WhenPresentMessagesCalledWithFailureResponse_ThenDisplayMessagesCalledWithCorrectViewModel() {
    // given
    let errorMessage = "Test message"
    let response = FetchMessages.Response(innerValue: .failure(errorMessage))
    
    let expectedAlertViewModel = AlertViewModel(title: Strings.error, message: errorMessage, buttonText: Strings.confirm)
    let expectedViewModel = FetchMessages.ViewModel(innerValue: .failure(expectedAlertViewModel))
    
    // when - then
    assertPresentMessagesCall(response: response, expectedViewModel: expectedViewModel, expectedCellViewModels: [])
  }
  
  func assertPresentMessagesCall(response: FetchMessages.Response,
                                 expectedViewModel: FetchMessages.ViewModel,
                                 expectedCellViewModels: [CellViewModel]?,
                                 file: StaticString = #file,
                                 line: UInt = #line) {
    // when
    sut.presentMessages(response: response)
    
    // then
    XCTAssertEqual(sut.cellViewModels, expectedCellViewModels, "Expected cell view models are not as expected")
    
    XCTAssertEqual(mockDisplayer.displayMessagesCallCount, 1, "Display messages is not called 1 time")
    XCTAssertEqual(mockDisplayer.displayMessagesReceivedViewModel?.innerValue, expectedViewModel.innerValue, "View model is not as expected")
  }
}

// MARK: presentNewMessage(_:) tests

extension MessagesPresenterTests {
  func test_WhenPresentNewMessageCalled_ThenDisplayNewMessageCalledWithCorrectViewModel() {
    // given
    let message = "Test message"
    let username = "TestUsername"
    let response = NewMessage.Response(message: message, username: username)
    
    let newMessage = CellViewModel(newMessage: response)
    let wrapper: MessagesWrapper = TestHelper.loadJSONFromFile(name: TestHelper.stubMessagesResponseFileName)
    var expectedCellViewModels = wrapper.messages.map(CellViewModel.init)
    expectedCellViewModels.append(newMessage)
    
    // when
    sut.cellViewModels = expectedCellViewModels.dropLast()
    sut.presentNewMessage(response: response)
    
    // then
    XCTAssertEqual(mockDisplayer.displayNewMessageCallCount, 1, "Display new message is not calleed 1 time")
    XCTAssertEqual(mockDisplayer.displayNewMessageReceivedViewModel?.cellViewModels, expectedCellViewModels, "Cell view models are not as expected")
  }
}
