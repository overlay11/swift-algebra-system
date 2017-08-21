
protocol UnitalSemiring: Semiring {
    static var unit: Self { get }
}

extension UnitalSemiring {
    static func ** (x: Self, n: Int) -> Self {
        precondition(n >= 0)
        if n == 0 {
            return Self.unit
        } else {
            return power(x, n, {a, b in a * b})
        }
    }
    static var nonzeroElement: Self {
        return Self.unit
    }
}

extension UInt: UnitalSemiring {
    static var zero: UInt { return 0 }
    static var unit: UInt { return 1 }
}
