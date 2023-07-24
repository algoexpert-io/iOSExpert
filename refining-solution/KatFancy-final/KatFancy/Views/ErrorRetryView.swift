// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/4/23.

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

#Preview {
  ErrorRetryView(message: "This is a test error message.", viewModel: BrowseBreedsViewModel())
}
