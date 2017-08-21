
protocol Pair {
    associatedtype T
    var re: T { get }
    var im: T { get }
    init(_ re: T, _ im: T)
    init(_ re: T)
    init()
}

extension Pair where T: Equatable {
    static func == (x: Self, y: Self) -> Bool {
        return x.re == y.re && x.im == y.im
    }
}

extension Pair where T: Semigroup {
    static func + (x: Self, y: Self) -> Self {
        return Self(x.re + y.re, x.im + y.im)
    }
}

extension Pair where T: Monoid {
    init(_ re: T) {
        self.init(re, T.zero)
    }
    init() {
        self.init(T.zero, T.zero)
    }
}

extension Pair where T: Group {
    static prefix func - (x: Self) -> Self {
        return Self(-x.re, -x.im)
    }
}

extension Pair where T: InvolutiveRing {
    static postfix func * (x: Self) -> Self {
        return Self(x.re*, -x.im)
    }
    static func * (x: Self, y: Self) -> Self {
        return Self(x.re * y.re - y.im* * x.im, y.im * x.re + x.im * y.re*)
    }
}

extension Pair where T: UnitalRing {
    static var unit: Self {
        return Self(T.unit)
    }
    static var imaginaryUnit: Self {
        return Self(T.zero, T.unit)
    }
}

extension Pair where T: DivisionRing {
    static func / (x: Self, a: T) -> Self {
        return Self(x.re/a, x.im/a)
    }
}

extension Pair where T: Field & InvolutiveRing {
    static func / (x: Self, y: Self) -> Self {
        let r = y.re ** 2 + y.im ** 2
        let p = x * y*
        return Self(p.re/r, p.im/r)
    }
}

extension Pair where T: NormedSpace {
    var norm: Double {
        return (im.norm**2 + re.norm**2).squareRoot()
    }
}

struct PairOverTriviallyInvolutiveField<T: Field & TriviallyInvolutiveRing & NormedSpace>: Pair, Field, InvolutiveRing, Extension, NormedVectorSpace {
    var re: T
    var im: T
    init(_ re: T, _ im: T) {
        self.re = re
        self.im = im
    }
}

extension PairOverTriviallyInvolutiveField: CustomStringConvertible {
    var description: String {
        return "\(re) + \(im) * i"
    }
}

struct PairOverInvolutiveField<T: Field & InvolutiveRing & NormedSpace>: Pair, DivisionRing, InvolutiveRing, Extension, NormedVectorSpace {
    var re: T
    var im: T
    init(_ re: T, _ im: T) {
        self.re = re
        self.im = im
    }
}

extension PairOverInvolutiveField: CustomStringConvertible {
    var description: String {
        return "(\(re)) + (\(im)) * j"
    }
}

typealias Complex = PairOverTriviallyInvolutiveField<Double>
typealias Quaternion = PairOverInvolutiveField<Complex>
