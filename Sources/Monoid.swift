
protocol Monoid: Semigroup {
    static var zero: Self { get }
}

extension Monoid {
    static func * (x: Self, n: Int) -> Self {
        precondition(n >= 0)
        if n == 0 {
            return Self.zero
        } else {
            return power(x, n, {a, b in a + b})
        }
    }
}
