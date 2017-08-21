
protocol DivisionRing: UnitalRing {
    static func / (x: Self, y: Self) -> Self
    var inversed: Self { get }
}

extension DivisionRing {
    static func ** (x: Self, n: Int) -> Self {
        switch n {
        case let n where n < 0:
            return (x ** abs(n)).inversed
        case 0:
            return Self.unit
        default:
            return power(x, n, {a, b in a * b})
        }
    }
    var inversed: Self {
        return Self.unit / self
    }
}
