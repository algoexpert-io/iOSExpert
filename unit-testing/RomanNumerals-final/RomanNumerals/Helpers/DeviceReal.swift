// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/25/23.

import UIKit

struct DeviceReal: Device {
  var userFacingMessage: String {
    messageWithoutDevice.replacingOccurrences(of: placeholder, with: UIDevice.current.name)
  }
}
