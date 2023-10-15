// Copyright © 2023 AlgoExpert LLC. All rights reserved.

struct TempAndWeathers: Decodable {
  let temp: Double
  let weathers: [Weather]

  enum CodingKeys: String, CodingKey {
    case temp
    case weathers = "weather"
  }
}
