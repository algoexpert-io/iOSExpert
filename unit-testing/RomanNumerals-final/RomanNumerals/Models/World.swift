// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/26/23.

import Foundation

struct World {
  var device: Device
  var soundPlayer: SoundPlayer
  var persistentStorage: PersistentStorage
  var analyticsService: AnalyticsService
  var session: URLSession

  static let production: World = {
    World(
      device: DeviceReal(),
      soundPlayer: SoundPlayerReal(),
      persistentStorage: PersistentStorageReal(),
      analyticsService: AnalyticsServiceReal(),
      session: URLSession.shared
    )
  }()

  static let unitTest: World = {
    World(
      device: DeviceStub(name: "iPod Nano"),
      soundPlayer: SoundPlayerDummy(),
      persistentStorage: PersistentStorageFake(),
      analyticsService: AnalyticsServiceSpy(),
      session: URLSession.stub
    )
  }()
}
