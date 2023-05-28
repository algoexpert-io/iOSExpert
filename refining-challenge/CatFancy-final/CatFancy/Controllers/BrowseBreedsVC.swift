// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class BrowseBreedsVC: UIViewController {
  let deleSource: BrowseBreedsDeleSource
  private var loadingState: LoadingState = .notStarted
  private let photoCache = NSCache<NSString, UIImage>()
  private var isRefreshing = false
  private let onRequestFinished: ([Breed]) -> ()

  private var browseBreedsView: BrowseBreedsView {
    if let castedView = view as? BrowseBreedsView {
      return castedView
    } else {
      fatalError(fatalCastMessage(view: BrowseBreedsView.self))
    }
  }

  init(browseBreedsDelegate: BrowseBreedsDelegate, onRequestFinished: @escaping ([Breed]) -> () = { _ in }) {
    deleSource = BrowseBreedsDeleSource(browseBreedsDelegate: browseBreedsDelegate)
    self.onRequestFinished = onRequestFinished
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override func loadView() {
    view = BrowseBreedsView(frame: UIScreen.main.bounds)
    title = "Browse"
    browseBreedsView.setupTable(dataSource: deleSource, delegate: deleSource)
    browseBreedsView.refresh.addTarget(self, action: #selector(refreshBreeds(_:)), for: .valueChanged)
    browseBreedsView.retry.addTarget(self, action: #selector(retry), for: .touchUpInside)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    browseBreedsView.showLoadingState(loadingState)

    if loadingState == .notStarted {
      loadBreeds()
    } else if loadingState == .succeededWithBreeds {
      deleSource.sortBreeds()
      browseBreedsView.table.setContentOffset(.zero, animated: false)
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
        Current.soundPlayer.play(.sadTrombone)
      } else {
        deleSource.sortBreeds()
        loadingState = .succeededWithBreeds
        Current.soundPlayer.play(.chime)
      }
    } catch {
      deleSource.breeds = []
      loadingState = .failed
      Current.soundPlayer.play(.sadTrombone)
    }

    browseBreedsView.showLoadingState(loadingState)
    if isRefreshing {
      browseBreedsView.refresh.endRefreshing()
      isRefreshing = false
    }
    browseBreedsView.table.reloadData()
    onRequestFinished(deleSource.breeds)
  }

  @objc private func refreshBreeds(_ sender: Any) {
    isRefreshing = true
    loadBreeds()
  }

  @objc func retry() {
    loadBreeds()
  }
}
