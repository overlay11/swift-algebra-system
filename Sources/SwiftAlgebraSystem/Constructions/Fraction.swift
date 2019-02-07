struct Fraction<T: IntegralDomain> {
    private let numerator: T
    private let denominator: T

    init(_ numerator: T, _ denominator: T = T.unit) {
        precondition(denominator != T.zero)
        guard numerator != denominator else {
            self.numerator = T.unit
            self.denominator = T.unit
            return
        }
        self.numerator = numerator
        self.denominator = denominator
    }

    init() {
        self.init(T.zero)
    }
}

extension Fraction: CustomStringConvertible {
    var description: String {
        return "Fraction(\(numerator), \(denominator))"
    }
}

extension Fraction: Field {
    static func == (x: Fraction, y: Fraction) -> Bool {
        return x.numerator * y.denominator == x.denominator * y.numerator
    }

    static func + (x: Fraction, y: Fraction) -> Fraction {
        return Fraction(x.numerator*y.denominator + x.denominator*y.numerator, x.denominator*y.denominator)
    }

    static var unit: Fraction {
        return Fraction(T.unit)
    }

    static prefix func - (x: Fraction) -> Fraction {
        return Fraction(-x.numerator, x.denominator)
    }

    static func * (x: Fraction, y: Fraction) -> Fraction {
        return Fraction(x.numerator * y.numerator, x.denominator * y.denominator)
    }

    static func / (x: Fraction, y: Fraction) -> Fraction {
        return x * Fraction(y.denominator, y.numerator)
    }
}

extension Fraction where T: EuclideanDomain {
    init(_ numerator: T, _ denominator: T = T.unit) {
        precondition(denominator != T.zero)
        let gcd = T.greatestCommonDivisor(numerator, denominator)
        self.numerator = numerator /% gcd
        self.denominator = denominator /% gcd
    }
}

infix operator %%: MultiplicationPrecedence

func %% <T>(a: T, b: T) -> Fraction<T> where T: EuclideanDomain {
    return Fraction(a, b)
}
