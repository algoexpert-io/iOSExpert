// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import CoreLocation

// Relevant parts of sample response from OpenWeather:
//{
//  "current": {
//    "temp": 11.68,
//    "weather": [
//      {
//        "description": "clear sky",
//      }
//    ]
//  }
//}

enum WeatherRequester {
  private static let romeLatitude = 41.893333
  private static let romeLongitude = 12.482778
  static let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=\(romeLatitude)&lon=\(romeLongitude)&exclude=minutely,hourly,daily,alerts&units=metric&appid=\(Config.openWeatherKey)"

  static func getCurrentConditionsInRome() async -> String? {
    let conditionsLabelText = "Currently in Rome: "
    do {
      guard Config.openWeatherKey != "" else {
        return conditionsLabelText + "55° F, sunny"
      }

      guard let url = URL(string: urlString) else {
        fatalError(URL.couldNotInit(urlString: urlString))
      }

      let (data, _) = try await Current.session.data(from: url)
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let response = try decoder.decode(WeatherResponse.self, from: data)
      let tempAndWeathers = response.tempAndWeathers

      guard !tempAndWeathers.weathers.isEmpty else {
        Current.analyticsService.sendAnalyticsEvent(.weatherRequestFailed)
        return nil
      }

      let tempInCelsius = tempAndWeathers.temp
      let celsiusMeasurement = Measurement(value: tempInCelsius, unit: UnitTemperature.celsius)
      let fahrenheit = Int(celsiusMeasurement.converted(to: .fahrenheit).value.rounded())
      let description = tempAndWeathers.weathers[0].description
      Current.analyticsService.sendAnalyticsEvent(.weatherRequestSucceeded)
      return "\(conditionsLabelText)\(fahrenheit)° F, \(description)"
    } catch {
      Current.analyticsService.sendAnalyticsEvent(.weatherRequestFailed)
      return nil
    }
  }
}
