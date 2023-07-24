// Created by Josh Adams, who holds the copyright and reserves all rights, on 3/1/23.

import UIKit

class ConverterView: UIView {
  static let rowHeight: CGFloat = 60.0

  @UsesAutoLayout
  private(set) var decimalToRomanLabel: UILabel = {
    let decimalToRomanLabel = UILabel()
    decimalToRomanLabel.text = "Type a decimal integer in the UITextField below and then tap Convert to convert to Roman numerals."
    decimalToRomanLabel.font = .systemFont(ofSize: 14.0)
    decimalToRomanLabel.numberOfLines = 0
    return decimalToRomanLabel
  }()

  @UsesAutoLayout
  private(set) var decimalToRomanTextField: UITextField = {
    let decimalToRomanTextField = UITextField()
    decimalToRomanTextField.borderStyle = .roundedRect
    decimalToRomanTextField.text = ""
    decimalToRomanTextField.autocorrectionType = .no
    decimalToRomanTextField.autocapitalizationType = .none
    decimalToRomanTextField.spellCheckingType = .no
    return decimalToRomanTextField
  }()

  @UsesAutoLayout
  private(set) var decimalToRomanButton: UIButton = {
    let decimalToRomanButton = UIButton(type: .roundedRect)
    decimalToRomanButton.setTitle("  Convert", for: .normal)
    decimalToRomanButton.setTitleColor(.red, for: .normal)
    decimalToRomanButton.isHidden = true
    return decimalToRomanButton
  }()

  @UsesAutoLayout
  private(set) var romanToDecimalLabel: UILabel = {
    let romanToDecimalLabel = UILabel()
    romanToDecimalLabel.text = "Type Roman numerals in the UITextField below and then tap Convert to convert to decimal."
    romanToDecimalLabel.font = .systemFont(ofSize: 14.0)
    romanToDecimalLabel.numberOfLines = 0
    return romanToDecimalLabel
  }()

  @UsesAutoLayout
  private(set) var romanToDecimalTextField: UITextField = {
    let romanToDecimalTextField = UITextField()
    romanToDecimalTextField.borderStyle = .roundedRect
    romanToDecimalTextField.text = ""
    romanToDecimalTextField.autocorrectionType = .no
    romanToDecimalTextField.autocapitalizationType = .none
    romanToDecimalTextField.spellCheckingType = .no
    return romanToDecimalTextField
  }()

  @UsesAutoLayout
  private(set) var romanToDecimalButton: UIButton = {
    let romanToDecimalButton = UIButton(type: .roundedRect)
    romanToDecimalButton.setTitle("  Convert", for: .normal)
    romanToDecimalButton.setTitleColor(.red, for: .normal)
    romanToDecimalButton.isHidden = true
    return romanToDecimalButton
  }()

  @UsesAutoLayout
  private(set) var tableView: UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = ConverterView.rowHeight
    return tableView
  }()

  @UsesAutoLayout
  private(set) var clearButton: UIButton = {
    let clearButton = UIButton(type: .roundedRect)
    clearButton.setTitle("Clear Results", for: .normal)
    clearButton.setTitleColor(.red, for: .normal)
    clearButton.isHidden = true
    return clearButton
  }()

  @UsesAutoLayout
  private(set) var weatherLabel: UILabel = {
    let weatherLabel = UILabel()
    weatherLabel.numberOfLines = 0
    return weatherLabel
  }()

  @UsesAutoLayout
  private(set) var deviceLabel: UILabel = {
    let deviceLabel = UILabel()
    deviceLabel.numberOfLines = 0
    return deviceLabel
  }()

  required init(coder aDecoder: NSCoder) {
    NSCoder.fatalErrorNotImplemented()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = .secondarySystemBackground

    [
      decimalToRomanLabel, decimalToRomanTextField, decimalToRomanButton,
      romanToDecimalLabel, romanToDecimalTextField, romanToDecimalButton,
      tableView, clearButton, weatherLabel, deviceLabel
    ].forEach {
      addSubview($0)
    }

    decimalToRomanLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Layout.standard).activate()
    decimalToRomanLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    decimalToRomanLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    decimalToRomanLabel.bottomAnchor.constraint(equalTo: decimalToRomanTextField.topAnchor, constant: Layout.standard * -1.0).activate()

    decimalToRomanTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()

    decimalToRomanButton.centerYAnchor.constraint(equalTo: decimalToRomanTextField.centerYAnchor).activate()
    decimalToRomanButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    decimalToRomanButton.leadingAnchor.constraint(equalTo: decimalToRomanTextField.trailingAnchor).activate()

    romanToDecimalLabel.topAnchor.constraint(equalTo: decimalToRomanTextField.bottomAnchor, constant: Layout.standard).activate()
    romanToDecimalLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    romanToDecimalLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    romanToDecimalLabel.bottomAnchor.constraint(equalTo: romanToDecimalTextField.topAnchor, constant: Layout.standard * -1.0).activate()

    romanToDecimalTextField.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()

    romanToDecimalButton.centerYAnchor.constraint(equalTo: romanToDecimalTextField.centerYAnchor).activate()
    romanToDecimalButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    romanToDecimalButton.leadingAnchor.constraint(equalTo: romanToDecimalTextField.trailingAnchor).activate()

    tableView.topAnchor.constraint(equalTo: romanToDecimalTextField.bottomAnchor, constant: Layout.standard).activate()
    tableView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    tableView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    tableView.bottomAnchor.constraint(equalTo: clearButton.topAnchor, constant: Layout.standard * -1.0).activate()

    clearButton.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    clearButton.bottomAnchor.constraint(equalTo: weatherLabel.topAnchor, constant: Layout.standard * -1.0).activate()

    weatherLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    weatherLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    weatherLabel.bottomAnchor.constraint(equalTo: deviceLabel.topAnchor, constant: Layout.standard * -1.0).activate()

    deviceLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    deviceLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    deviceLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: Layout.standard * -1.0).activate()
  }

  func setupTable(dataSource: UITableViewDataSource) {
    tableView.dataSource = dataSource
    tableView.register(ResultCell.self, forCellReuseIdentifier: "\(ResultCell.self)")
  }

  func setupTextViews(delegate: UITextFieldDelegate?) {
    romanToDecimalTextField.delegate = delegate
    decimalToRomanTextField.delegate = delegate
  }

  func scrollTableAndSetClearButtonVisibility(lastRow: Int) {
    tableView.reloadData()
    if lastRow >= 0 {
      tableView.scrollToRow(at: IndexPath(item: lastRow, section: 0), at: .bottom, animated: true)
      clearButton.isHidden = false
    } else {
      clearButton.isHidden = true
    }
  }
}
