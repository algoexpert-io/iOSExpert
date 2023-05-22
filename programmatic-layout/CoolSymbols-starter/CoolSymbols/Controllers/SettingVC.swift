// Created by Josh Adams, who holds the copyright and reserves all rights, on 2/1/23.

import UIKit

class SettingVC: UIViewController {
  @IBOutlet weak var sortSegmentedControl: UISegmentedControl!

  override func viewDidLoad() {
    super.viewDidLoad()
    sortSegmentedControl.selectedSegmentIndex = SortOrder.current.segmentIndex
  }

  @IBAction func sortOrderChanged() {
    SortOrder.current = SortOrder.sortOrderForIndex(sortSegmentedControl.selectedSegmentIndex)
  }
}
