@testable import SwiftAlgebraSystem

import XCTest

class PolynomialTests: XCTestCase {
    func testDegree() {
        XCTAssertEqual(Polynomial([0]).degree, -1)
        XCTAssertEqual(Polynomial([3]).degree, 0)
        XCTAssertEqual(Polynomial([-9, 3]).degree, 1)
        XCTAssertEqual(Polynomial([-7, -8, -8]).degree, 2)
    }

    func testEquality() {
        XCTAssertEqual(Polynomial([0]), Polynomial([]))
        XCTAssertEqual(Polynomial(0), Polynomial([]))
        XCTAssertEqual(Polynomial(0), Polynomial())

        XCTAssertEqual(Polynomial(4), Polynomial([4]))
        XCTAssertEqual(Polynomial([6, 4]), Polynomial([6, 4, 0]))
        XCTAssertEqual(Polynomial([0, -8, -9]), Polynomial([0, -8, -9]))

        XCTAssertNotEqual(Polynomial([3, 4]), Polynomial([3, 4, 3]))
        XCTAssertNotEqual(Polynomial([-9, 3, -5]), Polynomial([0, 6, -4]))
    }

    func testAddition() {
        let p: Polynomial = [1, 5, 1]
        let q: Polynomial = [3, -5, 1]
        XCTAssertEqual(p + q, Polynomial([4, 0, 2]))
        XCTAssertEqual(p - q, Polynomial([-2, 10]))

        XCTAssertEqual(Polynomial([-8, 7, 9]) + Polynomial([5, 2, -3]), Polynomial([-3, 9, 6]))
        XCTAssertEqual(Polynomial([-5, -4, 6]) - Polynomial([-9, 3, -4]), Polynomial([4, -7, 10]))
    }

    func testMultiplication() {
        XCTAssertEqual(Polynomial([2, -3]) * Polynomial([1, -7, 1]), Polynomial([2, -17, 23, -3]))
        XCTAssertEqual(Polynomial([-1, 2, 3]) * Polynomial([-3, 0, 0, -5]), Polynomial([3, -6, -9, 5, -10, -15]))
    }

    func testDivision() {
        let p: Polynomial = [-7, -5, 2, -1, 3]
        let q: Polynomial = [-4, 1, 1]
        XCTAssertEqual(p /% q, Polynomial([18, -4, 3]))
        XCTAssertEqual(p % q, Polynomial([65, -39]))

        XCTAssertEqual(Polynomial([-3, 0, 4, 1]) % Polynomial([-5, 1]), Polynomial(222))
    }
}
