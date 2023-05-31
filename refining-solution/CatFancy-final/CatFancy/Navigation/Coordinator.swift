// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

protocol Coordinator {
  var navigationController: UINavigationController { get set }
  func start()
}
