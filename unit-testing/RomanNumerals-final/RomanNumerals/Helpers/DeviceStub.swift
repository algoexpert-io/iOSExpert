// Created by Josh Adams, who holds the copyright and reserves all rights, on 4/17/23.

struct DeviceStub: Device {
  let name: String

  var userFacingMessage: String {
    messageWithoutDevice.replacingOccurrences(of: placeholder, with: name)
  }
}
