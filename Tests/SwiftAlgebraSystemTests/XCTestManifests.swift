import XCTest

extension FractionTests {
    static let __allTests = [
        ("testAddition", testAddition),
        ("testDescription", testDescription),
        ("testDivision", testDivision),
        ("testEquality", testEquality),
        ("testMultiplication", testMultiplication),
    ]
}

extension PairTests {
    static let __allTests = [
        ("testAddition", testAddition),
        ("testDescription", testDescription),
        ("testDivision", testDivision),
        ("testEquality", testEquality),
        ("testMultiplication", testMultiplication),
    ]
}

extension PolynomialTests {
    static let __allTests = [
        ("testAddition", testAddition),
        ("testDegree", testDegree),
        ("testDerivative", testDerivative),
        ("testDescription", testDescription),
        ("testDivision", testDivision),
        ("testEquality", testEquality),
        ("testEuclideanAlgorithm", testEuclideanAlgorithm),
        ("testMultiplication", testMultiplication),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FractionTests.__allTests),
        testCase(PairTests.__allTests),
        testCase(PolynomialTests.__allTests),
    ]
}
#endif
