// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import SwiftUI

struct BreedDetailsView: View {
  let breed: Breed
  @Environment(\.openURL) var openURL
  @State private var image: UIImage?
  private let photoHeightWidth: CGFloat = 250.0

  var body: some View {
    VStack {
      Group {
        if let image {
          Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
        } else {
          ProgressView()
        }
      }
      .frame(width: photoHeightWidth, height: photoHeightWidth)
      .task {
        await image = Current.imageLoader.fetch(breed.photoUrl)
      }

      ScrollView {
        Text(breed.description)
      }

      Spacer()

      Text("Photo Credit: \(breed.credit)")

      Spacer()

      HStack {
        Button("Show License") {
          openURL(breed.license.url)
        }

        Spacer()

        Button("View in Wikipedia") {
          openURL(breed.infoUrl)
        }
      }
    }
    .navigationTitle(breed.name)
    .padding()
  }
}

#Preview {
  NavigationStack {
    BreedDetailsView(breed: MockData.breed)
  }
}
