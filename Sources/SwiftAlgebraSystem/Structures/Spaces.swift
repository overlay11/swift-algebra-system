
protocol VectorSpace: AbelianGroup {
    associatedtype T: Field
    static func * (x: Self, a: T) -> Self
    static func / (x: Self, a: T) -> Self
}

func * <T, U>(a: T, x: U) -> U where U: VectorSpace, T == U.T {
    return x * a
}

protocol MetricSpace {
    static func metric(_ x: Self, _ y: Self) -> Double
}

func metric<T>(_ x: T, _ y: T) -> Double where T: MetricSpace {
    return T.metric(x, y)
}

protocol NormedSpace: MetricSpace, AbelianGroup {
    var norm: Double { get }
    var squaredNorm: Double { get }
}

extension NormedSpace {
    static func metric(_ x: Self, _ y: Self) -> Double {
        return (x - y).norm
    }
}

func norm<T>(_ x: T) -> Double where T: NormedSpace {
    return x.norm
}

extension Double: NormedSpace {
    var norm: Double { return abs(self) }
    var squaredNorm: Double { return self**2 }
}

protocol NormedVectorSpace: VectorSpace, NormedSpace { }

protocol EuclideanSpace: NormedVectorSpace {
    static func ** (x: Self, y: Self) -> Double
}

extension EuclideanSpace {
    var norm: Double {
        return (self ** self).squareRoot()
    }
    var squareRoot: Double {
        return self ** self
    }
}
