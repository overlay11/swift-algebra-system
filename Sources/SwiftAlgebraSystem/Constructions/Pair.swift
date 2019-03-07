struct Pair<T: Monoid> {
    let re: T
    let im: T

    init(_ re: T, _ im: T = T.zero) {
        self.re = re
        self.im = im
    }

    init() {
        self.init(T.zero)
    }
}

extension Pair: CustomStringConvertible {
    var description: String {
        return "Pair(\(re), \(im))"
    }
}

extension Pair: Equatable {
    static func == (x: Pair, y: Pair) -> Bool {
        return x.re == y.re && x.im == y.im
    }
}

extension Pair: Semigroup {
    static func + (x: Pair, y: Pair) -> Pair {
        return Pair(x.re + y.re, x.im + y.im)
    }
}

extension Pair: Monoid {}

extension Pair: CommutativeSemigroup, CommutativeMonoid where T: CommutativeMonoid {}

extension Pair: Group where T: Group {
    static prefix func - (x: Pair) -> Pair {
        return Pair(-x.re, -x.im)
    }
}

extension Pair: AbelianGroup where T: AbelianGroup {}

extension Pair: Semiring, Ring, InvolutiveRing where T: InvolutiveRing {
    static postfix func * (x: Pair) -> Pair {
        return Pair(x.re*, -x.im)
    }
    static func * (x: Pair, y: Pair) -> Pair {
        return Pair(x.re * y.re - y.im* * x.im, y.im * x.re + x.im * y.re*)
    }
}

extension Pair: Unital where T: InvolutiveRing & Unital {
    static var unit: Pair {
        return Pair(T.unit)
    }
    static var imaginaryUnit: Pair {
        return Pair(T.zero, T.unit)
    }
    static var symbol: Pair {
        return Pair.imaginaryUnit
    }
}

extension Pair where T: DivisionRing {
    static func / (x: Pair, a: T) -> Pair {
        return Pair(x.re/a, x.im/a)
    }
}

extension Pair: DivisionRing where T: DivisionRing & InvolutiveRing {
    static func / (x: Pair, y: Pair) -> Pair {
        let r = y.re ** 2 + y.im ** 2
        let p = x * y*
        return Pair(p.re/r, p.im/r)
    }
}

extension Pair: MetricSpace, VectorSpace, NormedSpace where T: Field & NormedSpace {
    typealias Scalar = T
    var squaredNorm: Double {
        return im.squaredNorm + re.squaredNorm
    }
    static func * (x: Pair, a: T) -> Pair {
        return Pair(x.re * a, x.im * a)
    }
}

extension Pair: Commutative where T: TriviallyInvolutiveRing {}

// extension Pair: EuclideanDomain where T: EuclideanDomain, InvolutiveRing {}

extension Pair: IntegralDomain, EuclideanDomain, Field where T: Field & TriviallyInvolutiveRing {}

typealias Complex = Pair<Double>
typealias Quaternion = Pair<Complex>

extension Pair where T == Complex {
    init(_ a: Double, _ b: Double = 0, _ c: Double = 0, _ d: Double = 0) {
        self.init(Complex(a, b), Complex(c, d))
    }
}
