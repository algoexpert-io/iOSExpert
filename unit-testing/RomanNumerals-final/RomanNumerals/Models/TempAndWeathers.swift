// Created by Josh Adams, who holds the copyright and reserves all rights, on 3/14/23.

struct TempAndWeathers: Decodable {
  let temp: Double
  let weathers: [Weather]

  enum CodingKeys: String, CodingKey {
    case temp
    case weathers = "weather"
  }
}
