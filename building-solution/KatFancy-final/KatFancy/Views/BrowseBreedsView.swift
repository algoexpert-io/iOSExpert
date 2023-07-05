// Created by Josh Adams, who holds the copyright and reserves all rights, on 6/30/23.

import SwiftUI

struct BrowseBreedsView: View {
  var viewModel = BrowseBreedsViewModel()

  var body: some View {
    NavigationStack {
      Group {
        switch viewModel.state {
        case .loading:
          ProgressView()
        case .error:
          ErrorRetryView(message: "An error occurred during breed fetching.", viewModel: viewModel)
        case .loaded(let breeds):
          if !breeds.isEmpty {
            Text("Loading succeeded. First breed: \(breeds[0].name)")
          } else {
            ErrorRetryView(message: "The endpoint returned an empty array of breeds.", viewModel: viewModel)
          }
        }
      }
      .navigationTitle("Cat Breeds")
    }
    .task {
      await viewModel.loadBreeds()
    }
  }
}
