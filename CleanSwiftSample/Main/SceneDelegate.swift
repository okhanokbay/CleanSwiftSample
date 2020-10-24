//
//  SceneDelegate.swift
//  CleanSwiftSample
//
//  Created by Okhan Okbay on 24.10.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(windowScene: windowScene)
    
    let loginViewController = LoginViewController.loadFromNib()
    let navigationController = UINavigationController(rootViewController: loginViewController)
    
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
}

