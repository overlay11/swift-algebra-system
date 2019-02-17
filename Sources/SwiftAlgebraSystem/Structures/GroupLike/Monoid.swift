protocol Monoid: Semigroup {
    static var zero: Self { get }
    init()
}

extension Monoid {
    static func * (x: Self, n: Int) -> Self {
        precondition(n >= 0)
        return n == 0 ? Self.zero : power(x, n, +)
    }
    static var zero: Self {
        return Self()
    }
}
