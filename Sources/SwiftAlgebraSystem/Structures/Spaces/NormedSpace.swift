protocol NormedSpace: MetricSpace, VectorSpace {
    var norm: Double { get }
    var squaredNorm: Double { get }
}

extension NormedSpace {
    static func metric(_ x: Self, _ y: Self) -> Double {
        return (x - y).norm
    }
    var norm: Double {
        return squaredNorm.squareRoot()
    }
    var squaredNorm: Double {
        return norm ** 2
    }
}

func norm<T>(_ x: T) -> Double where T: NormedSpace {
    return x.norm
}

extension Double: NormedSpace {
    typealias Scalar = Double
    var norm: Double {
        return self
    }
}
