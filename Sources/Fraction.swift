
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
    var reduced: Self {
        return numerator == denominator ? Self.unit : self
    }
}

extension FractionField where T: EuclideanDomain {
    var reduced: Self {
        let d = T.greatestCommonDivisor(numerator, denominator)
        return Self.init(numerator / d, denominator / d)
    }
}

struct Fraction_Field<T: IntegralDomain>: FractionField, Field {
    var numerator: T
    var denominator: T
    init(_ numerator: T, _ denominator: T) {
        self.numerator = numerator
        self.denominator = denominator
    }
}

typealias Fraction<T: IntegralDomain> = Fraction_Field<T>
