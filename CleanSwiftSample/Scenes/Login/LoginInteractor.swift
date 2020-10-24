//
//  LoginInteractor.swift
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

protocol LoginBusinessLogic: AnyObject {
  func usernameEntered(request: Login.Request)
}

final class LoginInteractor: LoginBusinessLogic {
  
  private let dataStore: LoginDataStoreProtocol
  private let presenter: LoginPresentationLogic
  
  init(dataStore: LoginDataStoreProtocol,
       presenter: LoginPresentationLogic) {
    
    self.dataStore = dataStore
    self.presenter = presenter
  }
  
  func usernameEntered(request: Login.Request) {
    let username = request.username ?? ""
    dataStore.username = username
    
    let funcToCall = username.count > ValidationRules.usernameMinCharLength ?
      presenter.presentMessages :
      presenter.presentAlert
    
    let response = Login.Response()
    funcToCall(response)
  }
}
