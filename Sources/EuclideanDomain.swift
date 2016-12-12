
protocol EuclideanDomain: IntegralDomain {
    var degree: Int { get }
    static func divideWithRemainder(_ x: Self, _ y: Self) -> (Self, remainder: Self)
    static func / (x: Self, y: Self) -> Self
    static func % (x: Self, y: Self) -> Self
    static func greatestCommonDivisor(_ x: Self, _ y: Self) -> Self
}

extension EuclideanDomain {
    static func / (x: Self, y: Self) -> Self {
        let (quotient, _) = Self.divideWithRemainder(x, y)
        return quotient
    }
    static func % (x: Self, y: Self) -> Self {
        return Self.divideWithRemainder(x, y).remainder
    }
    // Euclidean algorithm
    static func greatestCommonDivisor(_ x: Self, _ y: Self) -> Self {
        precondition(x != Self.zero || y != Self.zero)
        guard y != Self.zero else {
            return x
        }
        let r = x % y
        return r == Self.zero ? y : Self.greatestCommonDivisor(y, r)
    }
}

extension Int: EuclideanDomain {
    var degree: Int { return abs(self) }
    static func divideWithRemainder(_ x: Int, _ y: Int) -> (Int, remainder: Int) {
        return (x / y, x % y)
    }
}
