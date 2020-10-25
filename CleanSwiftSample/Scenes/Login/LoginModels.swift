//
//  LoginModels.swift
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

enum Login {
  struct Request {
    let username: String?
  }

  struct Response {}
  
  struct ViewModel {
    let alert: AlertViewModel?
    
    init() {
      self.alert = nil
    }
    
    init(alert: AlertViewModel) {
      self.alert = alert
    }
  }
}

enum AutoLogin {
  struct Request {}
  struct Response {}
  struct ViewModel {}
}
