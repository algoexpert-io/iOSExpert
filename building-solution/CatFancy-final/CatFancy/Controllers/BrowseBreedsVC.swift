// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/27/23.

import UIKit

class BrowseBreedsVC: UIViewController {
  private let soundPlayer = SoundPlayer()
  private let deleSource: BrowseBreedsDeleSource
  private var loadingState: LoadingState = .notStarted
  private var isRefreshing = false

  private var browseBreedsView: BrowseBreedsView {
    if let castedView = view as? BrowseBreedsView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: BrowseBreedsView.self))
    }
  }

  init() {
    deleSource = BrowseBreedsDeleSource()
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override func loadView() {
    view = BrowseBreedsView(frame: UIScreen.main.bounds)
    title = "Browse"
    browseBreedsView.setupTable(dataSource: deleSource, delegate: deleSource)
    browseBreedsView.refreshControl.addTarget(self, action: #selector(refreshBreeds(_:)), for: .valueChanged)
    browseBreedsView.retryButton.addTarget(self, action: #selector(retry), for: .touchUpInside)
    deleSource.navigationController = navigationController
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    browseBreedsView.showLoadingState(loadingState)

    if loadingState == .notStarted {
      loadBreeds()
    } else if loadingState == .succeededWithBreeds {
      deleSource.sortBreeds()
      browseBreedsView.tableView.setContentOffset(.zero, animated: false)
    }
  }

  private func loadBreeds() {
    Task {
      await loadBreedsAsync()
    }
  }

  private func loadBreedsAsync() async {
    loadingState = .loading
    browseBreedsView.showLoadingState(loadingState)

    do {
      let breeds = try await BreedsLoader.loadBreeds()
      deleSource.breeds = breeds
      if breeds.isEmpty {
        self.loadingState = .succeededWithNoBreeds
        soundPlayer.play(.sadTrombone)
      } else {
        deleSource.sortBreeds()
        loadingState = .succeededWithBreeds
        soundPlayer.play(.chime)
      }
    } catch {
      deleSource.breeds = []
      loadingState = .failed
      soundPlayer.play(.sadTrombone)
    }

    browseBreedsView.showLoadingState(loadingState)
    if isRefreshing {
      browseBreedsView.refreshControl.endRefreshing()
      isRefreshing = false
    }
    browseBreedsView.tableView.reloadData()
  }

  @objc private func refreshBreeds(_ sender: Any) {
    isRefreshing = true
    loadBreeds()
  }

  @objc func retry() {
    loadBreeds()
  }
}
