// Copyright © 2023 AlgoExpert LLC. All rights reserved.

import Foundation

class CatShelter {
  private var availableCats: ThreadSafeDictionary<AdoptableBreed, Int>
  private var waitingLists: ThreadSafeDictionary<AdoptableBreed, [Adopter]>

  private let statusClosure: (CatStatus) -> Void
  private let updateClosure: (String) -> Void

  init(statusClosure: @escaping (CatStatus) -> Void, updateClosure: @escaping (String) -> Void) {
    self.statusClosure = statusClosure
    self.updateClosure = updateClosure
    availableCats = ThreadSafeDictionary<AdoptableBreed, Int>()
    waitingLists = ThreadSafeDictionary<AdoptableBreed, [Adopter]>()

    AdoptableBreed.allCases.forEach {
      availableCats[$0] = 0
      waitingLists[$0] = []
    }

    let updateFrequencyInSeconds = 1.0
    Timer.scheduledTimer(withTimeInterval: updateFrequencyInSeconds, repeats: true) { _ in
      self.updateCatCensus()
    }
  }

  func requestCat(breed: AdoptableBreed, adopter: Adopter) {
    let lowercaseArticle = breed.article(shouldCapitalize: false)
    let availableCatsOfBreed = availableCats[breed] ?? 0

    if availableCatsOfBreed > 0 {
      self.availableCats[breed] = availableCatsOfBreed - 1
      updateClosure("\(adopter.rawValue) adopted \(lowercaseArticle) \(breed.rawValue).")
    } else {
      var waitingListForBreed = waitingLists[breed] ?? []
      waitingListForBreed.append(adopter)
      waitingLists[breed] = waitingListForBreed
      updateClosure("\(adopter.rawValue) got on the waiting list for \(lowercaseArticle) \(breed.rawValue).")
    }
  }

  func updateCatCensus() {
    defer {
      callStatusClosure()
    }

    let randomBreed = AdoptableBreed.randomBreed
    if
      let waitingListForBreed = waitingLists[randomBreed],
      waitingListForBreed.count > 0
    {
      let adopter = waitingListForBreed[0]
      waitingLists[randomBreed] = Array(waitingListForBreed.dropFirst())
      updateClosure("\(adopter.rawValue) adopted a newborn \(randomBreed.rawValue).")
    } else {
      let currentCount = availableCats[randomBreed] ?? 0
      availableCats[randomBreed] = currentCount + 1
      updateClosure("\(randomBreed.article(shouldCapitalize: true)) \(randomBreed.rawValue) was born and awaits a home.")
    }
  }

  private func callStatusClosure() {
    let catStatus = CatStatus(
      abyssinianPopulation: availableCats[.abyssinian] ?? 0,
      abyssinianWaitingList: waitingLists[.abyssinian]?.count ?? 0,
      burmesePopulation: availableCats[.burmese] ?? 0,
      burmeseWaitingList: waitingLists[.burmese]?.count ?? 0,
      smilodonPopulation: availableCats[.smilodon] ?? 0,
      smilodonWaitingList: waitingLists[.smilodon]?.count ?? 0,
      tonkinesePopulation: availableCats[.tonkinese] ?? 0,
      tonkineseWaitingList: waitingLists[.tonkinese]?.count ?? 0
    )

    statusClosure(catStatus)
  }
}
