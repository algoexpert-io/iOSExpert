// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/15/23.

import Foundation

enum WeatherRequester {
  private static let aoshimaLatitude = 33.736
  private static let aoshimaLongitude = 132.482
  static let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=\(aoshimaLatitude)&lon=\(aoshimaLongitude)&exclude=minutely,hourly,daily,alerts&units=metric&appid=\(Config.openWeatherKey)"

  static func getCurrentConditionsOnAoshima() async -> String? {
    let conditionsLabelText = "Currently in Rome: "
    do {
      guard Config.openWeatherKey != "" else {
        let simulatedDelay = 3
        try await Task.sleep(until: .now + .seconds(simulatedDelay))
        return conditionsLabelText + "55° F, sunny"
      }

      guard let url = URL(string: urlString) else {
        fatalError("Could not initialize URL from \(urlString).")
      }

      let (data, _) = try await URLSession.shared.data(from: url)
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let response = try decoder.decode(WeatherResponse.self, from: data)
      let tempAndWeathers = response.tempAndWeathers
      let tempInCelsius = tempAndWeathers.temp
      let celsiusMeasurement = Measurement(value: tempInCelsius, unit: UnitTemperature.celsius)
      let fahrenheit = Int(celsiusMeasurement.converted(to: .fahrenheit).value.rounded())
      let description = tempAndWeathers.weathers[0].description
      return "\(conditionsLabelText)\(fahrenheit)° F, \(description)"
    } catch {
      return nil
    }
  }
}
