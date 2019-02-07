@testable import SwiftAlgebraSystem

import XCTest

class PairTests: XCTestCase {
    func testDescription() {
        XCTAssert(String(describing: Complex()) == "Pair(0.0, 0.0)")
        XCTAssert(String(describing: Complex(-4)) == "Pair(-4.0, 0.0)")
        XCTAssert(String(describing: Complex(-8, 9)) == "Pair(-8.0, 9.0)")
    }

    func testEquality() {
        XCTAssert(Complex() == Complex(0))
        XCTAssert(Complex(3, -5) == Complex(3, -5))
        XCTAssert(Complex(4, 9) != Complex(4, -2))
        XCTAssert(Complex(-7, -8) != Complex(-4, -8))
    }

    func testAddition() {
        XCTAssert(Complex(2, 5) + Complex(1, -7) == Complex(3, -2))
        XCTAssert(Complex(3, -9) - Complex(7, 1) == Complex(-4, -10))
    }

    func testMultiplication() {
        XCTAssert(Complex(2, 1) * Complex(3, 4) == Complex(2, 11))
        XCTAssert(Complex(1, 2) * Complex(3, -1) == Complex(5, 5))

        XCTAssertEqual(
            Quaternion(-6, 3, 4, 3) * Quaternion(4, 5, -1, -3),
            Quaternion(-26, -27, 46, 7)
        )
        XCTAssertEqual(
            Quaternion(7, -6, 2, 3) * Quaternion(-2, -8, 9, 7),
            Quaternion(-101, -57, 77, 5)
        )
    }

    func testDivision() {
        XCTAssert(Complex(2, 5)/Complex(3, -2) == Complex(-4/13, 19/13))
        XCTAssert(Complex(23, 1)/Complex(2, 1) == Complex(47/5, -21/5))
    }
}
