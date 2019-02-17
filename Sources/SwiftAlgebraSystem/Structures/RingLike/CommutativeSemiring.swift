protocol CommutativeSemiring: Semiring {}

typealias Commutative = CommutativeSemiring
typealias CommutativeRing = Ring & Commutative

extension UInt: CommutativeSemiring {}
