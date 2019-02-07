@testable import SwiftAlgebraSystem

import XCTest

class FractionsTests: XCTestCase {
    func testDescription() {
        XCTAssert(String(describing: Fraction<Int>()) == "Fraction(0, 1)")
        XCTAssert(String(describing: Fraction(4)) == "Fraction(4, 1)")
        XCTAssert(String(describing: 6 %% 7) == "Fraction(6, 7)")
        XCTAssert(String(describing: 9 %% 6) == "Fraction(3, 2)")
    }

    func testEquality() {
        XCTAssert(Fraction(0) == Fraction())
        XCTAssert(6 %% 10 == 3 %% 5)
        XCTAssert(16 %% 36 == 4 %% 9)
        XCTAssert(7 %% 8 != 7 %% 4)
        XCTAssert(5 %% 9 != 4 %% 9)
    }

    func testAddition() {
        XCTAssert(1 %% 3 + 1 %% 6 == 1 %% 2)
        XCTAssert(29 %% 30 + 44 %% 45 == 35 %% 18)

        XCTAssert(5 %% 6 - 1 %% 2 == 1 %% 3)
        XCTAssert(3 %% 10 - 1 %% 6 == 2 %% 15)
    }

    func testMultiplication() {
        XCTAssert((2 %% 5) * (3 %% 4) == 3 %% 10)
        XCTAssert((5 %% 4) * (7 %% 6) == 35 %% 24)
    }

    func testDivision() {
        XCTAssert((1 %% 4)/(1 %% 8) == Fraction(2))
        XCTAssert((5 %% 7)/(3 %% 4) == 20 %% 21)
    }
}
