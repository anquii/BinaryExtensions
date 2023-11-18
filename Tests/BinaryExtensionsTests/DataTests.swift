import XCTest
import Foundation
import BinaryExtensions

final class DataTests: XCTestCase {
    func testInit_FromHexEncodedString_WithPrefix() {
        XCTAssertEqual(Data(hexEncodedString: "0x010203"), Data([1, 2, 3]))
    }

    func testInit_FromHexEncodedString_WithNoPrefix() {
        XCTAssertEqual(Data(hexEncodedString: "010203"), Data([1, 2, 3]))
    }

    func testInit_FromHexEncodedString_WithLeadingZeroesStripped() {
        XCTAssertEqual(Data(hexEncodedString: "00010203", stripLeadingZeroes: true), Data([1, 2, 3]))
    }

    func testInit_FromHexEncodedString_WithLeadingZeroesNotStripped() {
        XCTAssertEqual(Data(hexEncodedString: "00010203", stripLeadingZeroes: false), Data([0, 1, 2, 3]))
    }

    func testInit_FromHexEncodedString_WithOddLength_AndLeadingZeroesStripped() {
        XCTAssertEqual(Data(hexEncodedString: "000010203", stripLeadingZeroes: true), Data([1, 2, 3]))
    }

    func testInit_FromHexEncodedString_WithOddLength_AndLeadingZeroesNotStripped() {
        XCTAssertEqual(Data(hexEncodedString: "000010203", stripLeadingZeroes: false), Data([0, 0, 1, 2, 3]))
    }

    func testData_WhenHexEncodedString_WithLeadingZeroesStripped() {
        XCTAssertEqual(Data([0, 1, 2, 3]).hexEncodedString(stripLeadingZeroes: true), "10203")
    }

    func testData_WhenHexEncodedString_WithLeadingZeroesNotStripped() {
        XCTAssertEqual(Data([0, 1, 2, 3]).hexEncodedString(stripLeadingZeroes: false), "00010203")
    }
}
