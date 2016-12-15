
protocol FractionField: Field, CustomStringConvertible {
    associatedtype T
    var numerator: T { get }
    var denominator: T { get }
    init(_ numerator: T, _ denominator: T)
}

extension FractionField where T: IntegralDomain {
    var description: String {
        return "Fraction(\(numerator), \(denominator))"
    }
    static func == (x: Self, y: Self) -> Bool {
        return x.numerator * y.denominator == x.denominator * y.numerator
    }
    static var zero: Self {
        return Self.init(T.zero, T.nonzeroElement)
    }
    static var unit: Self {
        return Self.init(T.nonzeroElement, T.nonzeroElement)
    }
    static func + (x: Self, y: Self) -> Self {
        return Self.init(x.numerator * y.denominator + x.denominator * y.numerator, x.denominator * y.denominator)
    }
    static prefix func - (x: Self) -> Self {
        return Self.init(-x.numerator, x.denominator)
    }
    static func * (x: Self, y: Self) -> Self {
        return Self.init(x.numerator * y.numerator, x.denominator * y.denominator)
    }
    static func / (x: Self, y: Self) -> Self {
        return x * Self.init(y.denominator, y.numerator)
    }
}

struct Fraction_Field<T: IntegralDomain>: FractionField, Field {
    var numerator: T
    var denominator: T
    init(_ numerator: T, _ denominator: T) {
        if numerator == denominator {
            self = Fraction_Field<T>.unit
        } else {
            self.numerator = numerator
            self.denominator = denominator
        }
    }
}

struct ReducibleFraction_Field<T: EuclideanDomain>: FractionField, Field {
    var numerator: T
    var denominator: T
    init(_ numerator: T, _ denominator: T) {
        let gcd = T.greatestCommonDivisor(numerator, denominator)
        self.numerator = numerator / gcd
        self.denominator = denominator / gcd
    }
}

typealias Fraction<T: EuclideanDomain> = ReducibleFraction_Field<T>
