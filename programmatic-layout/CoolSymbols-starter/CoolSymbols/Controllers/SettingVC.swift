// Copyright © 2023 AlgoExpert LLC. All rights reserved.

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
