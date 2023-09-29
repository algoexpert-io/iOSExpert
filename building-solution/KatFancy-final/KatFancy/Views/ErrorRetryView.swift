// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/28/23.

import SwiftUI

struct ErrorRetryView: View {
  let message: String
  let viewModel: BrowseBreedsViewModel

  var body: some View {
    VStack {
      Text(message)
        .padding()

      Spacer()
        .frame(height: Layout.standard)

      Button("Retry") {
        Task {
          await viewModel.loadBreeds()
        }
      }
    }
  }
}
