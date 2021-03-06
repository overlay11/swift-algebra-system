protocol Semigroup: Equatable {
    static func + (x: Self, y: Self) -> Self
    static func * (x: Self, y: Int) -> Self
}

extension Semigroup {
    static func * (x: Self, n: Int) -> Self {
        precondition(n > 0)
        return power(x, n, +)
    }
}
