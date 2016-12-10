
protocol EuclideanDomain: IntegralDomain {
    var degree: Int { get }
    static func divideWithRemainder(_ x: Self, _ y: Self) -> (Self, remainder: Self)
    static func / (x: Self, y: Self) -> Self
    static func % (x: Self, y: Self) -> Self
}

extension EuclideanDomain {
    static func / (x: Self, y: Self) -> Self {
        let (quotient, _) = Self.divideWithRemainder(x, y)
        return quotient
    }
    static func % (x: Self, y: Self) -> Self {
        return Self.divideWithRemainder(x, y).remainder
    }
}

extension Int: EuclideanDomain {
    var degree: Int { return abs(self) }
    static func divideWithRemainder(_ x: Int, _ y: Int) -> (Int, remainder: Int) {
        return (x / y, x % y)
    }
}
