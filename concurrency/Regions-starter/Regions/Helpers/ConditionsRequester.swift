// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import CoreLocation

enum ConditionsRequester {
  private static let genericErrorMessage = "ERROR"
  private static let apiKeyErrorMessage = "Error: OpenWeather API key not set"

  static func getConditionsClassic(latitude: Double, longitude: Double, completion: @escaping (String) -> ()) {
    guard Config.openWeatherKey != "" else {
      completion(apiKeyErrorMessage)
      return
    }

    let request = URLRequest(url: urlFromCoordinates(latitude: latitude, longitude: longitude))
    URLSession.shared.dataTask(with: request) { data, _, error in
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      guard
        error == nil,
        let data = data,
        let response = try? decoder.decode(WeatherResponse.self, from: data)
      else {
        completion(genericErrorMessage)
        return
      }

      completion(conditionsFromTempAndWeathers(response.tempAndWeathers))
    }.resume()
  }

  static func getConditionsSC(latitude: Double, longitude: Double) async -> String {
    guard Config.openWeatherKey != "" else {
      return apiKeyErrorMessage
    }

    do {
      let (data, _) = try await URLSession.shared.data(from: urlFromCoordinates(latitude: latitude, longitude: longitude))
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let response = try decoder.decode(WeatherResponse.self, from: data)
      return conditionsFromTempAndWeathers(response.tempAndWeathers)
    } catch {
      return genericErrorMessage
    }
  }

  private static func urlFromCoordinates(latitude: Double, longitude: Double) -> URL {
    let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely,hourly,daily,alerts&units=metric&appid=\(Config.openWeatherKey)"

    guard let url = URL(string: urlString) else {
      fatalError(URL.couldNotInit(urlString: urlString))
    }

    return url
  }

  private static func conditionsFromTempAndWeathers(_ tempAndWeathers: TempAndWeathers) -> String {
    guard !tempAndWeathers.weathers.isEmpty else {
      return genericErrorMessage
    }
    let tempInCelsius = tempAndWeathers.temp
    let celsiusMeasurement = Measurement(value: tempInCelsius, unit: UnitTemperature.celsius)
    let fahrenheit = Int(celsiusMeasurement.converted(to: .fahrenheit).value.rounded())
    let description = tempAndWeathers.weathers[0].description
    return "\(fahrenheit)° F, \(description)"
  }
}
