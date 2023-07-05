// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/5/23.

import SwiftUI

struct BreedDetailsView: View {
  let breed: Breed
  @Environment(\.openURL) var openURL
  @State private var image: UIImage?
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
          showLicense()
        }

        Spacer()

        Button("View in Wikipedia") {
          viewInWikipedia()
        }
      }
    }
    .navigationTitle(breed.name)
    .padding()
  }

  private func showLicense() {
    openURL(breed.license.url)
  }

  private func viewInWikipedia() {
    openURL(breed.infoUrl)
  }
}