// Created by Josh Adams, who holds the copyright and reserves all rights, on 5/6/23.

class ReviewPrompterSpy: ReviewPrompter {
  var promptableActionsCount = 0

  func promptableActionHappened() {
    promptableActionsCount += 1
  }
}
