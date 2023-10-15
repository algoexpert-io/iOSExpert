// Copyright © 2023 AlgoExpert LLC. All rights reserved.

struct Converter {
  func convertFromDecimalToRoman(_ numString: String, shouldSendAnalyticsEvent: Bool = true) -> String? {
    let minConvertibleValue = 1
    let maxConvertibleValue = 4999

    guard
      let num = Int(numString),
      num >= minConvertibleValue,
      num <= maxConvertibleValue
    else {
      if shouldSendAnalyticsEvent {
        Current.analyticsService.sendAnalyticsEvent(.conversionFailed)
      }
      Current.soundPlayer.play(.sadTrombone)
      return nil
    }

    var romanString = ""

    let mCount = num / 1000
    for _ in 0 ..< mCount {
      romanString += "M"
    }

    var remaining = num % 1000
    if remaining >= 900 && remaining <= 999 {
      romanString += "CM"
      remaining -= 900
    }

    if remaining < 900 && remaining >= 500 {
      romanString += "D"
      remaining -= 500
    }

    if remaining < 500 && remaining >= 400 {
      romanString += "CD"
      remaining -= 400
    }

    if remaining < 400 && remaining >= 300 {
      romanString += "CCC"
      remaining -= 300
    }

    if remaining < 300 && remaining >= 200 {
      romanString += "CC"
      remaining -= 200
    }

    if remaining < 200 && remaining >= 100 {
      romanString += "C"
      remaining -= 100
    }

    if remaining < 100 && remaining >= 90 {
      romanString += "XC"
      remaining -= 90
    }

    if remaining < 90 && remaining >= 50 {
      romanString += "L"
      remaining -= 50
    }

    if remaining < 50 && remaining >= 40 {
      romanString += "XL"
      remaining -= 40
    }

    if remaining < 40 && remaining >= 30 {
      romanString += "XXX"
      remaining -= 30
    }

    if remaining < 30 && remaining >= 20 {
      romanString += "XX"
      remaining -= 20
    }

    if remaining < 20 && remaining >= 10 {
      romanString += "X"
      remaining -= 10
    }

    switch remaining {
    case 9:
      romanString += "IX"
    case 8:
      romanString += "VIII"
    case 7:
      romanString += "VII"
    case 6:
      romanString += "VI"
    case 5:
      romanString += "V"
    case 4:
      romanString += "IV"
    case 3:
      romanString += "III"
    case 2:
      romanString += "II"
    case 1:
      romanString += "I"
    default:
      break
    }

    if shouldSendAnalyticsEvent {
      Current.analyticsService.sendAnalyticsEvent(.conversionSucceeded)
    }
    Current.soundPlayer.play(.chime)
    return romanString
  }

  func convertFromRomanToDecimal(_ romanString: String) -> String? {
    let romanLetterValues: [String: Int] = ["M": 1000, "D": 500, "C": 100, "L": 50, "X": 10, "V": 5, "I": 1]
    let validRomanLetters = Set(romanLetterValues.keys)

    var romanArray: [String] = []
    for letter in romanString {
      if !validRomanLetters.contains(String(letter)) {
        Current.analyticsService.sendAnalyticsEvent(.conversionFailed)
        Current.soundPlayer.play(.sadTrombone)
        return nil
      }
      romanArray.append(String(letter))
    }

    let romanCount = romanArray.count
    var total = 0
    for i in 0 ..< romanCount {
      let letterValue = romanLetterValues[romanArray[i]]!
      if i + 1 < romanCount {
        let letterValueToRight = romanLetterValues[romanArray[i + 1]]!
        if letterValue >= letterValueToRight {
          total += letterValue
        } else {
          total -= letterValue
        }
      } else {
        total += letterValue
      }
    }

    let totalString = String(total)
    // IIII is invalid.
    guard convertFromDecimalToRoman(totalString, shouldSendAnalyticsEvent: false) == romanString else {
      Current.analyticsService.sendAnalyticsEvent(.conversionFailed)
      Current.soundPlayer.play(.sadTrombone)
      return nil
    }

    Current.analyticsService.sendAnalyticsEvent(.conversionSucceeded)
    Current.soundPlayer.play(.chime)
    return totalString
  }
}
