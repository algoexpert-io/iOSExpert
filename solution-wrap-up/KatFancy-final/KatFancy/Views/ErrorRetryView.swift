// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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
