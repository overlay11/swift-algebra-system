protocol UnitarySpace: NormedSpace where Scalar == Complex {
    static func <*> (x: Self, y: Self) -> Complex
}

extension UnitarySpace {
    var squaredNorm: Double {
        return (self <*> self).norm
    }
}
