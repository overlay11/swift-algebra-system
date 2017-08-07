
protocol Monoid: Semigroup {
    static var zero: Self { get }
    static var nonzeroElement: Self { get }
    init()
}

extension Monoid {
    static func * (x: Self, n: Int) -> Self {
        precondition(n >= 0)
        return n == 0 ? Self.zero : power(x, n, {a, b in a + b})
    }
    static var zero: Self {
        return Self()
    }
}
