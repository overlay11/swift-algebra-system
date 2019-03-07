infix operator <*>: MultiplicationPrecedence

protocol EuclideanSpace: NormedSpace where Scalar == Double {
    static func <*> (x: Self, y: Self) -> Double
}

extension EuclideanSpace {
    var squaredNorm: Double {
        return self <*> self
    }
}
