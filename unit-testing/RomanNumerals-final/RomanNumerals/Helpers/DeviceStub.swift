// Copyright © 2023 AlgoExpert LLC. All rights reserved.

struct DeviceStub: Device {
  let name: String

  var userFacingMessage: String {
    messageWithoutDevice.replacingOccurrences(of: placeholder, with: name)
  }
}
