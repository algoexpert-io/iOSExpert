// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class BrowseBreedsViewTests: XCTestCase {
  func testShowLoadingState() {
    let bbv = BrowseBreedsView(frame: CGRect.zero)
    XCTAssertNotNil(bbv)
    [
      (LoadingState.notStarted, true, true, true, true, true),
      (.loading, true, false, true, true, true),
      (.succeededWithBreeds, false, true, true, true, true),
      (.succeededWithNoBreeds, true, true, false, false, false),
      (.failed, true, true, false, false, false)
    ].forEach {
      verifyVisibility(
        loadingState: $0.0,
        view: bbv,
        tableView: $0.1,
        activityIndicatorView: $0.2,
        statusLabel: $0.3,
        statusDescription: $0.4,
        retryButton: $0.5
      )
    }
  }

  private func verifyVisibility(
    loadingState: LoadingState,
    view: BrowseBreedsView,
    tableView: Bool,
    activityIndicatorView: Bool,
    statusLabel: Bool,
    statusDescription: Bool,
    retryButton: Bool
  ) {
    view.showLoadingState(loadingState)
    XCTAssertEqual(tableView, view.tableView.isHidden)
    XCTAssertEqual(activityIndicatorView, view.activityIndicatorView.isHidden)
    XCTAssertEqual(statusLabel, view.statusLabel.isHidden)
    XCTAssertEqual(statusDescription, view.statusDescription.isHidden)
    XCTAssertEqual(retryButton, view.retryButton.isHidden)
  }
}
