// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class SettingsVCTests: XCTestCase {
  func testControlValueChanges() {
    let svc = SettingsVC()
    svc.beginAppearanceTransition(true, animated: false)

    Current.settings.breedsURL = .standard
    XCTAssertEqual(Current.settings.breedsURL, BreedsURL.standard)
    let breedsURLControl = svc.settingsView.breedsURLControl

    breedsURLControl.selectedSegmentIndex = 1
    breedsURLControl.sendActions(for: .valueChanged)
    XCTAssertEqual(Current.settings.breedsURL, BreedsURL.empty)

    breedsURLControl.selectedSegmentIndex = 2
    breedsURLControl.sendActions(for: .valueChanged)
    XCTAssertEqual(Current.settings.breedsURL, BreedsURL.malformed)

    breedsURLControl.selectedSegmentIndex = 3
    breedsURLControl.sendActions(for: .valueChanged)
    XCTAssertEqual(Current.settings.breedsURL, BreedsURL.withMore)

    breedsURLControl.selectedSegmentIndex = 0
    breedsURLControl.sendActions(for: .valueChanged)
    XCTAssertEqual(Current.settings.breedsURL, BreedsURL.standard)

    Current.settings.sessionType = .shared
    XCTAssertEqual(Current.settings.sessionType, SessionType.shared)
    let sessionTypeControl = svc.settingsView.sessionTypeControl

    sessionTypeControl.selectedSegmentIndex = 1
    sessionTypeControl.sendActions(for: .valueChanged)
    XCTAssertEqual(Current.settings.sessionType, SessionType.stub)

    sessionTypeControl.selectedSegmentIndex = 0
    sessionTypeControl.sendActions(for: .valueChanged)
    XCTAssertEqual(Current.settings.sessionType, SessionType.shared)

    Current.settings.sortOrder = .name
    XCTAssertEqual(Current.settings.sortOrder, SortOrder.name)
    let sortOrderControl = svc.settingsView.sortOrderControl

    sortOrderControl.selectedSegmentIndex = 1
    sortOrderControl.sendActions(for: .valueChanged)
    XCTAssertEqual(Current.settings.sortOrder, SortOrder.popularity)

    sortOrderControl.selectedSegmentIndex = 0
    sortOrderControl.sendActions(for: .valueChanged)
    XCTAssertEqual(Current.settings.sortOrder, SortOrder.name)
  }

  func testUpdateControls() {
    let svc = SettingsVC()

    Current.settings.breedsURL = .standard
    let breedsURLControl = svc.settingsView.breedsURLControl
    svc.viewDidLoad()
    XCTAssertEqual(0, breedsURLControl.selectedSegmentIndex)
    Current.settings.breedsURL = .empty
    svc.viewDidLoad()
    XCTAssertEqual(1, breedsURLControl.selectedSegmentIndex)
    Current.settings.breedsURL = .malformed
    svc.viewDidLoad()
    XCTAssertEqual(2, breedsURLControl.selectedSegmentIndex)
    Current.settings.breedsURL = .withMore
    svc.viewDidLoad()
    XCTAssertEqual(3, breedsURLControl.selectedSegmentIndex)
    Current.settings.breedsURL = .standard
    svc.viewDidLoad()
    XCTAssertEqual(0, breedsURLControl.selectedSegmentIndex)

    Current.settings.sortOrder = .name
    svc.viewDidLoad()
    let sortOrderControl = svc.settingsView.sortOrderControl
    svc.viewDidLoad()
    XCTAssertEqual(0, sortOrderControl.selectedSegmentIndex)
    Current.settings.sortOrder = .name
    svc.viewDidLoad()
    XCTAssertEqual(0, sortOrderControl.selectedSegmentIndex)
    Current.settings.sortOrder = .popularity
    svc.viewDidLoad()
    XCTAssertEqual(1, sortOrderControl.selectedSegmentIndex)
  }
}
