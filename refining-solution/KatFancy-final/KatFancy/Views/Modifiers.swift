// Created by Josh Adams, who holds the copyright and reserves all rights, on 1/6/23.

import SwiftUI

extension View {
  func segmentedPicker() -> some View {
    modifier(SegmentedPicker())
  }

  func destructiveButton() -> some View {
    modifier(DestructiveButton())
  }
}

private struct SegmentedPicker: ViewModifier {
  func body(content: Content) -> some View {
    content
      .pickerStyle(SegmentedPickerStyle())
      .padding(.horizontal, Layout.doubleDefaultSpacing)
  }
}

private struct DestructiveButton: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.red)
      .buttonStyle(.bordered)
      .tint(.red)
  }
}

private struct ModifiersView: View {
  @State var selection = BreedsURL.withMore

  var body: some View {
    VStack {
      Text("segmentedPicker")
        .font(.headline)

      Picker("", selection: $selection) {
        ForEach(BreedsURL.allCases, id: \.self) { breedsURL in
          Text(breedsURL.displayName)
        }
      }
      .segmentedPicker()

      Spacer()
        .frame(height: Layout.tripleDefaultSpacing)

      Text("destructiveButton")
        .font(.headline)

      Button("Don't Tap This") {
        Current.soundPlayer.play(.sadTrombone)
      }
      .destructiveButton()
    }
  }
}

struct ModifiersView_Previews: PreviewProvider {
  static var previews: some View {
    ModifiersView()
  }
}
