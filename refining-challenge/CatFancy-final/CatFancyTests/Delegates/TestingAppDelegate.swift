// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import UIKit

@objc(TestingAppDelegate)
final class TestingAppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Remove any cached scene configurations to ensure that
    // TestingAppDelegate.application(_:configurationForConnecting:options:) is
    // called and that TestingSceneDelegate will be used when running unit tests.
    for sceneSession in application.openSessions {
      application.perform(Selector(("_removeSessionFromSessionSet:")), with: sceneSession)
    }
    return true
  }

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    let sceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
    sceneConfiguration.delegateClass = TestingSceneDelegate.self
    return sceneConfiguration
  }
}
