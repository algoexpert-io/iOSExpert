// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/25/23.

struct DeviceStub: Device {
  let name: String

  var userFacingMessage: String {
    messageWithoutDevice.replacingOccurrences(of: placeholder, with: name)
  }
}
