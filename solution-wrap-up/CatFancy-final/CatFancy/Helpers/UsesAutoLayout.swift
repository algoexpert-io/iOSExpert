// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

@propertyWrapper
public struct UsesAutoLayout<T: UIView> {
  public var wrappedValue: T {
    didSet {
      wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
  }

  public init(wrappedValue: T) {
    self.wrappedValue = wrappedValue
    wrappedValue.translatesAutoresizingMaskIntoConstraints = false
  }
}
