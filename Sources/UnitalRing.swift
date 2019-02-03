
protocol UnitalRing: Ring, UnitalSemiring { }

extension Int: UnitalRing {
    static var unit: Int { return 1 }
}
