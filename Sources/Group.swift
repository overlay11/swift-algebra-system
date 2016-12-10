
protocol Group: Monoid {
    static func - (x: Self, y: Self) -> Self
    static prefix func - (x: Self) -> Self
}

extension Group {
    static func - (x: Self, y: Self) -> Self {
        return x + -y
    }
    static func * (x: Self, n: Int) -> Self {
        switch n {
        case let n where n < 0:
            return -x * abs(n)
        case 0:
            return Self.zero
        default:
            return power(x, n, {a, b in a + b})
        }
    }
}
