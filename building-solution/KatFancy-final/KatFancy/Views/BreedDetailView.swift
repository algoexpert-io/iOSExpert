// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/28/23.

import SwiftUI

struct BreedDetailsView: View {
  let breed: Breed
  @Environment(\.openURL) var openURL
  private let photoHeightWidth: CGFloat = 250.0

  var body: some View {
    VStack {
      AsyncImage(url: breed.photoUrl) { image in
        image
          .resizable()
          .scaledToFill()
      } placeholder: {
          Image(systemName: "pawprint.fill")
            .resizable()
            .scaledToFit()
      }
      .frame(width: photoHeightWidth, height: photoHeightWidth)

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
