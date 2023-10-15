// Copyright © 2023 AlgoExpert LLC. All rights reserved.

@testable import RomanNumerals
import XCTest

final class ConverterTests: XCTestCase {
  func testConvertFromDecimalToRoman() {
    let converter = Converter()

    XCTAssertNil(converter.convertFromDecimalToRoman("coconut"))
    XCTAssertNil(converter.convertFromDecimalToRoman("0"))
    XCTAssertNil(converter.convertFromDecimalToRoman("5000"))
    XCTAssertEqual(converter.convertFromDecimalToRoman("1"), "I")
    XCTAssertEqual(converter.convertFromDecimalToRoman("4999"), "MMMMCMXCIX")
    XCTAssertEqual(converter.convertFromDecimalToRoman("700"), "DCC")
    XCTAssertEqual(converter.convertFromDecimalToRoman("450"), "CDL")
    XCTAssertEqual(converter.convertFromDecimalToRoman("300"), "CCC")
    XCTAssertEqual(converter.convertFromDecimalToRoman("100"), "C")
    XCTAssertEqual(converter.convertFromDecimalToRoman("40"), "XL")
    XCTAssertEqual(converter.convertFromDecimalToRoman("30"), "XXX")
    XCTAssertEqual(converter.convertFromDecimalToRoman("20"), "XX")
    XCTAssertEqual(converter.convertFromDecimalToRoman("10"), "X")
    XCTAssertEqual(converter.convertFromDecimalToRoman("8"), "VIII")
    XCTAssertEqual(converter.convertFromDecimalToRoman("7"), "VII")
    XCTAssertEqual(converter.convertFromDecimalToRoman("6"), "VI")
    XCTAssertEqual(converter.convertFromDecimalToRoman("5"), "V")
    XCTAssertEqual(converter.convertFromDecimalToRoman("4"), "IV")
    XCTAssertEqual(converter.convertFromDecimalToRoman("3"), "III")
    XCTAssertEqual(converter.convertFromDecimalToRoman("2"), "II")
    XCTAssertEqual(converter.convertFromDecimalToRoman("1"), "I")
  }

  func testConvertFromRomanToDecimal() {
    let converter = Converter()

    XCTAssertNil(converter.convertFromRomanToDecimal("COCONUT"))
    XCTAssertNil(converter.convertFromRomanToDecimal("IIII"))
    XCTAssertEqual(converter.convertFromRomanToDecimal("MDCLXIV"), "1664")
  }
}
