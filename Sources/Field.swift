
protocol Field: DivisionRing, EuclideanDomain { }

extension Field {
    var degree: Int {
        return self == Self.zero ? 0 : 1
    }
    static func divideWithRemainder(_ x: Self, _ y: Self) -> (Self, remainder: Self) {
        return (x / y, Self.zero)
    }
    static func % (x: Self, y: Self) -> Self {
        return Self.zero
    }
}

extension Double: Field {
    static var zero: Double { return 0.0 }
    static var unit: Double { return 1.0 }
}
