// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import Foundation

protocol BreedDetailDelegate: AnyObject {
  func showWebpage(url: URL, didSucceed: ((Bool) -> ())?)
}
