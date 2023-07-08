// Created by Josh Adams, who holds the copyright and reserves all rights, on 6/30/23.

import SwiftUI

struct BrowseBreedsView: View {
  var viewModel = BrowseBreedsViewModel()
  @State private var images: [String: UIImage] = [:]
  private let photoHeightWidth: CGFloat = 150
  private let mockedState: BrowseBreedsViewModel.State?

  init(mockedState: BrowseBreedsViewModel.State? = nil) {
    self.mockedState = mockedState
  }

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
            list(of: breeds)
              .refreshable {
                await viewModel.loadBreeds(mockedState: mockedState)
              }
          } else {
            ErrorRetryView(message: "The endpoint returned an empty array of breeds.", viewModel: viewModel)
          }
        }
      }
      .navigationTitle("Cat Breeds")
    }
    .task {
      await viewModel.loadBreeds(mockedState: mockedState)
    }
  }

  func list(of breeds: [Breed]) -> some View {
    List(breeds) { breed in
      NavigationLink {
        BreedDetailsView(breed: breed)
      } label: {
        HStack {
          VStack(alignment: .leading) {
            Text(breed.name)
              .font(.headline)
            Text(breed.knownFor)
            Text("Popularity: \(breed.popularity)")
          }

          Spacer()

          Group {
            if let image = images[breed.name] {
              Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            } else {
              ProgressView()
            }
          }
          .frame(width: photoHeightWidth)
          .task {
            await images[breed.name] = Current.imageLoader.fetch(breed.photoUrl)
          }
        }
        .padding()
      }
    }
  }
}

#Preview("Mocked Data") {
  BrowseBreedsView(mockedState: .loaded(breeds: MockData.breeds))
}

#Preview("Actual Data") {
  BrowseBreedsView()
}

#Preview("No Data") {
  BrowseBreedsView(mockedState: .loaded(breeds: []))
}

#Preview("Error") {
  BrowseBreedsView(mockedState: .error)
}

#Preview("Loading") {
  BrowseBreedsView(mockedState: .loading)
}
