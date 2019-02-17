protocol UnitalSemiring: Semiring {
    static var unit: Self { get }
}

extension UnitalSemiring {
    static func ** (x: Self, n: Int) -> Self {
        precondition(n >= 0)
        if n == 0 {
            return Self.unit
        } else {
            return power(x, n, *)
        }
    }
}

extension UInt: UnitalSemiring {
    static let zero: UInt = 0
    static let unit: UInt = 1
}

typealias Unital = UnitalSemiring
typealias UnitalRing = Ring & Unital
