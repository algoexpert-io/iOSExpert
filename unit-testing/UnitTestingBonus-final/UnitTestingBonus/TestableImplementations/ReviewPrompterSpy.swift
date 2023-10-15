// Copyright © 2023 AlgoExpert LLC. All rights reserved.

class ReviewPrompterSpy: ReviewPrompter {
  var promptableActionsCount = 0

  func promptableActionHappened() {
    promptableActionsCount += 1
  }
}
