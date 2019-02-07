@testable import SwiftAlgebraSystem

import XCTest

class PolynomialTests: XCTestCase {
    func testDescription() {
        XCTAssert(String(describing: Polynomial<Int>()) == "Polynomial(0)")
        XCTAssert(String(describing: Polynomial(-8)) == "Polynomial(-8)")
        XCTAssert(String(describing: Polynomial(2, -9)) == "Polynomial(2, -9)")
        XCTAssert(String(describing: Polynomial(-5, 8, 7)) == "Polynomial(-5, 8, 7)")
    }

    func testDegree() {
        XCTAssert(Polynomial(0).degree == -1)
        XCTAssert(Polynomial(3).degree == 0)
        XCTAssert(Polynomial(-9, 3).degree == 1)
        XCTAssert(Polynomial(-7, -8, -8).degree == 2)
    }

    func testEquality() {
        XCTAssert(Polynomial(0) == Polynomial())

        XCTAssert(Polynomial(4) == Polynomial(4))
        XCTAssert(Polynomial(6, 4) == Polynomial(6, 4, 0))
        XCTAssert(Polynomial(0, -8, -9) == Polynomial(0, -8, -9))

        XCTAssert(Polynomial(3, 4) != Polynomial(3, 4, 3))
        XCTAssert(Polynomial(-9, 3, -5) != Polynomial(-9, 6, -5))
    }

    func testAddition() {
        XCTAssertEqual(
            Polynomial(-8, 7, 9) + Polynomial(5, 2, -3),
            Polynomial(-3, 9, 6)
        )

        XCTAssertEqual(
            Polynomial(-5, -4, 6) - Polynomial(-9, 3, -4),
            Polynomial(4, -7, 10)
        )

        XCTAssertEqual(
            Polynomial(1, 5, 1) - Polynomial(3, -5, 1),
            Polynomial(-2, 10)
        )
    }

    func testMultiplication() {
        XCTAssertEqual(
            Polynomial(2, -3) * Polynomial(1, -7, 1),
            Polynomial(2, -17, 23, -3)
        )

        XCTAssertEqual(
            Polynomial(-1, 2, 3) * Polynomial(-3, 0, 0, -5),
            Polynomial(3, -6, -9, 5, -10, -15)
        )
    }

    func testDivision() {
        let p: Polynomial<Double> = [-7, -5, 2, -1, 3]
        let q: Polynomial<Double> = [-4, 1, 1]

        XCTAssert(p /% q == Polynomial(18, -4, 3))
        XCTAssert(p % q == Polynomial(65, -39))

        XCTAssert(Polynomial(-3, 0, 4, 1) % Polynomial(-5, 1) == Polynomial(222))
    }

    func testEuclideanAlgorithm() {
        let p: Polynomial<Double> = [-6, 11, -6, 1]
        let q: Polynomial<Double> = [6, -7, 0, 1]

        XCTAssertEqual(
            Polynomial.greatestCommonDivisor(p, q).monic(),
            Polynomial(2, -3, 1)
        )
    }

    func testDerivative() {
        XCTAssert(Polynomial(-7, -5, 3).derivative() == Polynomial(-5, 6))
        XCTAssert(Polynomial(0, -1, 0, 0, 0, 2).derivative() == Polynomial(-1, 0, 0, 0, 10))
        XCTAssert(Polynomial(17, 0, 5, -4, 0, 0, -6, 3).derivative() == Polynomial(0, 10, -12, 0, 0, -36, 21))
    }
}
