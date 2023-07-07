// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/6/23.

import Foundation
import Observation

var Current = World.chooseWorld()

@Observable
class World {
  var settings = Settings(getterSetter: GetterSetterFake())
  var soundPlayer: SoundPlayer = SoundPlayerDummy()
  var imageLoader = ImageLoader()

  init(settings: Settings, soundPlayer: SoundPlayer, imageLoader: ImageLoader) {
    self.settings = settings
    self.soundPlayer = soundPlayer
    self.imageLoader = imageLoader
  }

  static func chooseWorld() -> World {
    if NSClassFromString("XCTest") != nil {
      return World.unitTest
    } else {
      return World.production
    }
  }

  static let production: World = {
    let settings = Settings(getterSetter: GetterSetterReal())

    return World(
      settings: settings,
      soundPlayer: SoundPlayerReal(),
      imageLoader: ImageLoader()
    )
  }()

  static let unitTest: World = {
    let settings = Settings(getterSetter: GetterSetterFake())
    settings.sessionType = .stub

    return World(
      settings: settings,
      soundPlayer: SoundPlayerDummy(),
      imageLoader: ImageLoader()
    )
  }()
}
