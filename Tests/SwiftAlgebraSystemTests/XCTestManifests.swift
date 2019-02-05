import XCTest

extension PolynomialTests {
    static let __allTests = [
        ("testAddition", testAddition),
        ("testDegree", testDegree),
        ("testDivision", testDivision),
        ("testEquality", testEquality),
        ("testMultiplication", testMultiplication),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(PolynomialTests.__allTests),
    ]
}
#endif
