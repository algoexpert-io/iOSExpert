// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class TestingSceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = TestingRootViewController()
    window?.makeKeyAndVisible()
  }
}
