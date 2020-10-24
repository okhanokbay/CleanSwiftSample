//
//  LoginPresenter.swift
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

protocol LoginPresentationLogic: AnyObject {
  func presentMessages(response: Login.Response)
  func presentAlert(response: Login.Response)
}

final class LoginPresenter: LoginPresentationLogic {
  
  private weak var displayer: LoginDisplayLogic!
  
  init(displayer: LoginDisplayLogic!) {
    self.displayer = displayer
  }
  
  func presentMessages(response: Login.Response) {
    let viewModel = Login.ViewModel()
    displayer.displayMessages(viewModel: viewModel)
  }
  
  func presentAlert(response: Login.Response) {
    let alert = AlertViewModel(title: Strings.error,
                               message: Strings.usernameCharacterLength,
                               buttonText: Strings.confirm)
    
    let viewModel = Login.ViewModel(alert: alert)
    displayer.displayAlert(viewModel: viewModel)
  }
}
