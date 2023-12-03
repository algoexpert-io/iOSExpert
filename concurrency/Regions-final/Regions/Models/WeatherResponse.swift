// Copyright © 2023 AlgoExpert LLC. All rights reserved.

struct WeatherResponse: Decodable {
  let tempAndWeathers: TempAndWeathers

  enum CodingKeys: String, CodingKey {
    case tempAndWeathers = "current"
  }
}
