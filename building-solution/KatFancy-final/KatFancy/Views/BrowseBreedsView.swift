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
          Text("An error occurred.")
        case .loaded(let breeds):
          if !breeds.isEmpty {
            Text("Loading succeeded. First breed: \(breeds[0].name)")
          } else {
            Text("The endpoint returned an empty array of beeds.")
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
