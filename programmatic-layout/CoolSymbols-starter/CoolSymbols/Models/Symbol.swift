// Created by Josh Adams, who holds the copyright and reserves all rights, on 2/1/23.

struct Symbol: Comparable {
  let name: String
  let category: String

  private static var allSymbols: [Symbol] = [
    Symbol(name: "123.rectangle.fill", category: "Text Formatting"),
    Symbol(name: "arrowshape.bounce.right.fill", category: "Arrows"),
    Symbol(name: "arrowtriangle.right.circle.fill", category: "Gaming"),
    Symbol(name: "bag.fill", category: "Commerce"),
    Symbol(name: "banknote.fill", category: "Commerce"),
    Symbol(name: "bolt.horizontal.fill", category: "Connectivity"),
    Symbol(name: "bubble.left.fill", category: "Communication"),
    Symbol(name: "camera.macro", category: "What's New"),
    Symbol(name: "car.fill", category: "Transportation"),
    Symbol(name: "cloud.drizzle.fill", category: "Weather"),
    Symbol(name: "globe.europe.africa.fill", category: "Nature"),
    Symbol(name: "hare.fill", category: "Nature"),
    Symbol(name: "heart.fill", category: "Health"),
    Symbol(name: "hourglass", category: "Time"),
    Symbol(name: "hurricane", category: "Weather"),
    Symbol(name: "infinity", category: "Media"),
    Symbol(name: "keyboard.fill", category: "Keyboard"),
    Symbol(name: "mic.fill", category: "Communication"),
    Symbol(name: "moon.fill", category: "Weather"),
    Symbol(name: "paperplane.fill", category: "Objects & Tools"),
    Symbol(name: "person.2.fill", category: "Human"),
    Symbol(name: "printer.fill", category: "Devices"),
    Symbol(name: "scissors", category: "Editing"),
    Symbol(name: "seal.fill", category: "Shapes"),
    Symbol(name: "sterlingsign.square.fill", category: "Indices"),
    Symbol(name: "sun.max.fill", category: "Weather"),
    Symbol(name: "x.squareroot", category: "Math")
  ]

  static var allSymbolsSorted = allSymbols.sorted()

  static func sort() {
    allSymbolsSorted = allSymbols.sorted()
  }

  static func < (lhs: Symbol, rhs: Symbol) -> Bool {
    switch SortOrder.current {
    case .name:
      return lhs.name.caseInsensitiveCompare(rhs.name) == .orderedAscending
    case .category:
      return lhs.category.caseInsensitiveCompare(rhs.category) == .orderedAscending
    }
  }

  static func == (lhs: Symbol, rhs: Symbol) -> Bool {
    lhs.name == rhs.name && lhs.category == rhs.category
  }
}
