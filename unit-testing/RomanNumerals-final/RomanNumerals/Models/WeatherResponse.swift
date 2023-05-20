// Created by Josh Adams, who holds the copyright and reserves all rights, on 3/14/23.

struct WeatherResponse: Decodable {
  let tempAndWeathers: TempAndWeathers

  enum CodingKeys: String, CodingKey {
    case tempAndWeathers = "current"
  }
}
