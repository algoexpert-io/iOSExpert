// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import UIKit

protocol Coordinator {
  var navigationController: UINavigationController { get set }
  func start()
}
