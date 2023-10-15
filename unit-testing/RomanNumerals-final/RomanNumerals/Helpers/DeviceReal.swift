// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

struct DeviceReal: Device {
  var userFacingMessage: String {
    messageWithoutDevice.replacingOccurrences(of: placeholder, with: UIDevice.current.name)
  }
}
