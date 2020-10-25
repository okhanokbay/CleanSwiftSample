//
//  Mocks.swift
//  CleanSwiftSampleTests
//
//  Created by Okhan Okbay on 25.10.2020.
//

@testable import CleanSwiftSample
import Foundation

class MockMessagesWorker: MessagesWorkerProtocol {
  var shouldReturnSuccess: Bool = true
  
  func fetchMessageHistory(completion: @escaping (Result<[Message], MessageAPIError>) -> Void) {
    
    if shouldReturnSuccess {
      let wrapper: MessagesWrapper = TestHelper.loadJSONFromFile(name: TestHelper.stubMessagesResponseFileName)
      completion(.success(wrapper.messages))
      
    } else {
      completion(.failure(.serverError(customDescription: "Server error")))
    }
  }
}


class MockMessagesDataStore: MessagesDataStoreProtocol {
  var username: String?
}

class MockPresenter: MessagesPresentationLogic {
  var presentInitialsCallCount = 0
  var presentInitialsReceivedResponse: MessagesViewInitials.Response?
  
  var presentMessagesCallCount = 0
  var presentMessagesReceivedResponse: FetchMessages.Response?
  
  var presentNewMessageCallCount = 0
  var presentNewMessageReceivedResponse: NewMessage.Response?
  
  func presentInitials(response: MessagesViewInitials.Response) {
    presentInitialsCallCount += 1
    presentInitialsReceivedResponse = response
  }
  
  func presentMessages(response: FetchMessages.Response) {
    presentMessagesCallCount += 1
    presentMessagesReceivedResponse = response
  }
  
  func presentNewMessage(response: NewMessage.Response) {
    presentNewMessageCallCount += 1
    presentNewMessageReceivedResponse = response
  }
}

class MockInteractor: MessagesBusinessLogic {
  var setupInitialsCallCount = 0
  var setupInitialsReceivedRequest: MessagesViewInitials.Request?
  
  var fetchMessagesCallCount = 0
  var fetchMessagesReceivedRequest: FetchMessages.Request?
  
  var sendMessageCallCount = 0
  var sendMessageReceivedRequest: NewMessage.Request?
  
  func setupInitials(request: MessagesViewInitials.Request) {
    setupInitialsCallCount += 1
    setupInitialsReceivedRequest = request
  }
  
  func fetchMessages(request: FetchMessages.Request) {
    fetchMessagesCallCount += 1
    fetchMessagesReceivedRequest = request
  }
  
  func sendMessage(request: NewMessage.Request) {
    sendMessageCallCount += 1
    sendMessageReceivedRequest = request
  }
}

class MockDisplayer: MessagesDisplayLogic {
  var displayInitialsCallCount = 0
  var displayInitialsReceivedViewModel: MessagesViewInitials.ViewModel?
  
  var displayMessagesCallCount = 0
  var displayMessagesReceivedViewModel: FetchMessages.ViewModel?
  
  var displayNewMessageCallCount = 0
  var displayNewMessageReceivedViewModel: NewMessage.ViewModel?
  
  func displayInitials(viewModel: MessagesViewInitials.ViewModel) {
    displayInitialsCallCount += 1
    displayInitialsReceivedViewModel = viewModel
  }
  
  func displayMessages(viewModel: FetchMessages.ViewModel) {
    displayMessagesCallCount += 1
    displayMessagesReceivedViewModel = viewModel
  }
  
  func displayNewMessage(viewModel: NewMessage.ViewModel) {
    displayNewMessageCallCount += 1
    displayNewMessageReceivedViewModel = viewModel
  }
}
