
protocol UnitalRing: Ring {
    static var unit: Self { get }
}

extension UnitalRing {
    static func ** (x: Self, n: Int) -> Self {
        precondition(n >= 0)
        if n == 0 {
            return Self.unit
        } else {
            return power(x, n, {a, b in a * b})
        }
    }
}

extension Int: UnitalRing {
    static var zero: Int { return 0 }
    static var unit: Int { return 1 }
}
