
protocol UnitalRing: Ring, UnitalSemiring { }

extension Int: UnitalRing {
    static var zero: Int { return 0 }
    static var unit: Int { return 1 }
}
