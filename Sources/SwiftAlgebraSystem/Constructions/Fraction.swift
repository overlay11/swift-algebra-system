
protocol Fraction: CustomStringConvertible {
    associatedtype T
    var numerator: T { get }
    var denominator: T { get }
    init(_ numerator: T, _ denominator: T)
    init(_ a: T)
    init()
}

extension Fraction {
    var description: String {
        return "\(numerator) ÷ \(denominator)"
    }
}

extension Fraction where T: Monoid {
    static var unit: Self {
        return Self(T.nonzeroElement, T.nonzeroElement)
    }
    init() {
        self.init(T.zero, T.nonzeroElement)
    }
}

extension Fraction where T: Group {
    static prefix func - (x: Self) -> Self {
        return Self(-x.numerator, x.denominator)
    }
}

extension Fraction where T: Semiring {
    static func == (x: Self, y: Self) -> Bool {
        return x.numerator * y.denominator == x.denominator * y.numerator
    }
    static func + (x: Self, y: Self) -> Self {
        return Self(x.numerator * y.denominator + x.denominator * y.numerator, x.denominator * y.denominator)
    }
    static func * (x: Self, y: Self) -> Self {
        return Self(x.numerator * y.numerator, x.denominator * y.denominator)
    }
    static func / (x: Self, y: Self) -> Self {
        return x * Self(y.denominator, y.numerator)
    }
    init(_ a: T) {
        self.init(a * T.nonzeroElement, T.nonzeroElement)
    }
}

struct FractionOverIntegralDomain<T: IntegralDomain>: Fraction, Field, Extension {
    var numerator: T
    var denominator: T
    init(_ numerator: T, _ denominator: T) {
        precondition(denominator != T.zero)
        if numerator == denominator {
            self = FractionOverIntegralDomain.unit
        } else {
            self.numerator = numerator
            self.denominator = denominator
        }
    }
}

struct FractionOverEuclideanDomain<T: EuclideanDomain>: Fraction, Field, Extension {
    var numerator: T
    var denominator: T
    init(_ numerator: T, _ denominator: T) {
        precondition(denominator != T.zero)
        let gcd = T.greatestCommonDivisor(numerator, denominator)
        self.numerator = numerator / gcd
        self.denominator = denominator / gcd
    }
}

infix operator ÷: MultiplicationPrecedence

func ÷ <T>(a: T, b: T) -> FractionOverEuclideanDomain<T> where T: EuclideanDomain {
    return FractionOverEuclideanDomain(a, b)
}
