//
//  MessagesPresenter.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MessagesPresentationLogic {
  func presentInitials(response: MessagesViewInitials.Response)
  func presentMessages(response: FetchMessages.Response)
  func presentNewMessage(response: NewMessage.Response)
}

final class MessagesPresenter {
  private weak var displayer: MessagesDisplayLogic!
  var cellViewModels: [CellViewModel]
  
  init(displayer: MessagesDisplayLogic) {
    self.displayer = displayer
    cellViewModels = []
  }
}

extension MessagesPresenter: MessagesPresentationLogic {
  func presentInitials(response: MessagesViewInitials.Response) {
    let viewModel = MessagesViewInitials.ViewModel(title: response.title)
    displayer.displayInitials(viewModel: viewModel)
  }
  
  func presentMessages(response: FetchMessages.Response) {
    switch response.innerValue {
    case .success(let messages):
      cellViewModels = messages.map(CellViewModel.init)
      
      let viewModel = FetchMessages.ViewModel(innerValue: .success(cellViewModels))
      displayer.displayMessages(viewModel: viewModel)
      
    case .failure(let errorMessage):
      let viewModel = FetchMessages.ViewModel(innerValue: .failure(.init(title: Strings.error,
                                                                                message: errorMessage,
                                                                                buttonText: Strings.confirm)))
      displayer.displayMessages(viewModel: viewModel)
      
    }
  }
  
  func presentNewMessage(response: NewMessage.Response) {
    cellViewModels.append(CellViewModel.init(newMessage: response))
    
    let viewModel = NewMessage.ViewModel(cellViewModels: cellViewModels)
    displayer.displayNewMessage(viewModel: viewModel)
  }
}
