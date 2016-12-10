
precedencegroup ExponentiationPrecedence {
    higherThan: MultiplicationPrecedence
    associativity: right
}

infix operator **: ExponentiationPrecedence
protocol Ring: AbelianGroup {
    static func * (x: Self, y: Self) -> Self
    static func ** (x: Self, n: Int) -> Self
}

extension Ring {
    static func ** (x: Self, n: Int) -> Self {
        precondition(n > 0)
        return power(x, n, {a, b in a * b})
    }
}
