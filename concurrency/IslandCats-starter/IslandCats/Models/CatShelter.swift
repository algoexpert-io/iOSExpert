// Created by Josh Adams, who holds the copyright and reserves all rights, on 7/22/23.

//NEXT: Update UITextView. May need to run on MainActor or similar.

actor CatShelter {
  private var availableCats: [AdoptableBreed: Int]
  private var waitingList: [AdoptableBreed: [Adopter]]
  let statusClosure: (CatStatus) -> Void
  let updateClosure: (String) -> Void

  init(statusClosure: @escaping (CatStatus) -> Void, updateClosure: @escaping (String) -> Void) {
    self.statusClosure = statusClosure
    self.updateClosure = updateClosure
    waitingList = [:]
    availableCats = [:]

    Task {
      await populateAvailableCatsAndWaitingList()
    }

    _ = Task(priority: .userInitiated) {
      while true {
        await updateCatCensus()
        let updateFrequencyInNanoseconds: UInt64 = 1_000_000_000
        try? await Task.sleep(nanoseconds: updateFrequencyInNanoseconds)
      }
    }
  }

  func populateAvailableCatsAndWaitingList() {
    AdoptableBreed.allCases.forEach {
      availableCats[$0] = 0
      waitingList[$0] = []
    }
  }

  func requestCat(breed: AdoptableBreed, adopter: Adopter) {
    let lowercaseArticle = breed.article(shouldCapitalize: false)
    let availableCatsOfBreed = availableCats[breed] ?? 0
    if availableCatsOfBreed > 0 {
      availableCats[breed] = availableCatsOfBreed - 1
      updateClosure("\(adopter.rawValue) adopted \(lowercaseArticle) \(breed.rawValue).")
    } else {
      var waitingListForBreed = waitingList[breed] ?? []
      waitingListForBreed.append(adopter)
      waitingList[breed] = waitingListForBreed
      updateClosure("\(adopter.rawValue) got on the waiting list for \(lowercaseArticle) \(breed.rawValue).")
    }
  }

  func updateCatCensus() {
    defer {
      callStatusClosure()
    }

    let randomBreed = AdoptableBreed.randomBreed
    if
      let waitingListForBreed = waitingList[randomBreed],
      waitingListForBreed.count > 0
    {
      let adopter = waitingListForBreed[0]
      waitingList[randomBreed] = Array(waitingListForBreed.dropFirst())
      updateClosure("\(adopter.rawValue) adopted a newborn \(randomBreed.rawValue).")
      return
    }

    let currentCount = availableCats[randomBreed] ?? 0
    availableCats[randomBreed] = currentCount + 1
    updateClosure("\(randomBreed.article(shouldCapitalize: true)) \(randomBreed.rawValue) was born and awaits a home.")
  }

  private func callStatusClosure() {
    let catStatus = CatStatus(
      abyssinianPopulation: availableCats[.abyssinian] ?? 0,
      abyssinianWaitingList: waitingList[.abyssinian]?.count ?? 0,
      burmesePopulation: availableCats[.burmese] ?? 0,
      burmeseWaitingList: waitingList[.burmese]?.count ?? 0,
      smilodonPopulation: availableCats[.smilodon] ?? 0,
      smilodonWaitingList: waitingList[.smilodon]?.count ?? 0,
      tonkinesePopulation: availableCats[.tonkinese] ?? 0,
      tonkineseWaitingList: waitingList[.tonkinese]?.count ?? 0
    )

    statusClosure(catStatus)
  }
}
