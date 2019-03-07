protocol MetricSpace: Equatable {
    static func metric(_ x: Self, _ y: Self) -> Double
}

func metric<T>(_ x: T, _ y: T) -> Double where T: MetricSpace {
    return T.metric(x, y)
}
