// Copyright © 2023 AlgoExpert LLC. All rights reserved.

enum Localization {
  private static var localizations: [String: String] = [
    "Abyssinian": "アビシニアン",
    "Balinese": "バリニーズ",
    "Bengal": "ベンガル",
    "Burmese": "バーミーズ",
    "Clouded Leopard": "ウンピョウ",
    "Devon Rex": "デボンレックス",
    "European Wildcat": "ヤマネコ",
    "Maine Coon": "メインクーン",
    "Manx": "マンクス",
    "Ragdoll": "ラグドール",
    "Russian Blue": "ロシアンブルー",
    "Sand Cat": "スナネコ",
    "Savannah": "サバンナ猫",
    "Serval": "サーバル",
    "Siamese": "シャム",
    "Smilodon": "スミロドン",
    "Tonkinese": "トンキニーズ",
    "Turkish Angora": "ターキッシュアンゴラ",
    "Van": "ヴァン猫"
  ]

  static func forBreed(_ breed: String) -> String {
    let unknown = "知らない"
    return localizations[breed] ?? unknown
  }
}
