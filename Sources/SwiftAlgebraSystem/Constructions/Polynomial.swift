struct Polynomial<Coefficient: Monoid> {
    private var coefficients: [Coefficient]

    var degree: Int {
        return coefficients.count - 1
    }

    init<T>(_ coefficients: T) where T: Sequence, T.Element == Coefficient {
        self.coefficients = Array(coefficients)
        while self.coefficients.last == Coefficient.zero {
            self.coefficients.removeLast()
        }
    }

    init(_ coefficients: Coefficient...) {
        self.init(coefficients)
    }

    init() {
        coefficients = []
    }

    static func monomial(coefficient: Coefficient, degree: Int) -> Polynomial {
        return Polynomial(Array(repeating: Coefficient.zero, count: degree) + [coefficient])
    }

    func derivative() -> Polynomial {
        return Polynomial(
            self.enumerated().dropFirst().map { $0.1 * $0.0 }
        )
    }
}

extension Polynomial: CustomStringConvertible {
    var description: String {
        guard degree >= 0 else {
            return "Polynomial(\(Coefficient.zero))"
        }
        return "Polynomial(" + self.map { "\($0)" }.joined(separator: ", ") + ")"
    }
}

extension Polynomial: RandomAccessCollection {
    var startIndex: Int {
        return 0
    }
    var endIndex: Int {
        return degree + 1
    }
    subscript(i: Int) -> Coefficient {
        return coefficients[i]
    }
}

extension Polynomial: ExpressibleByArrayLiteral {
    init(arrayLiteral: Coefficient...) {
        self.init(arrayLiteral)
    }
}

extension Polynomial: Equatable {
    static func == (p: Polynomial, q: Polynomial) -> Bool {
        return p.coefficients == q.coefficients
    }
}

extension Polynomial: Semigroup {
    static func + (p: Polynomial, q: Polynomial) -> Polynomial {
        let (n, m) = (p.degree, q.degree)
        let u = zip(p, q).map(+)
        let v = (n > m ? p : q).suffix(abs(n - m))
        return Polynomial(u + v)
    }
}

extension Polynomial: Monoid {
    static var nonzeroElement: Polynomial {
        return Polynomial(Coefficient.nonzeroElement)
    }
}

extension Polynomial: Group where Coefficient: Group {
    static prefix func - (p: Polynomial) -> Polynomial {
        return Polynomial(p.map(-))
    }
}

extension Polynomial: CommutativeSemigroup, CommutativeMonoid where Coefficient: CommutativeMonoid {}

extension Polynomial: AbelianGroup where Coefficient: AbelianGroup {}

extension Polynomial: Semiring where Coefficient: Semiring {
    static func * (p: Polynomial, q: Polynomial) -> Polynomial {
        let (n, m) = (p.degree, q.degree)
        guard n >= 0 && m >= 0 else {
            return Polynomial()
        }
        let r = (0 ... n+m).map { i in
            (0...i).map { j in
                let k = i - j
                guard j <= n && k <= m else {
                    return Coefficient.zero
                }
                return p[j] * q[k]
            }.reduce(Coefficient.zero, +)
        }
        return Polynomial(r)
    }
}

extension Polynomial: Ring where Coefficient: Ring {}

extension Polynomial: UnitalSemiring where Coefficient: UnitalSemiring {
    static var unit: Polynomial {
        return Polynomial(Coefficient.unit)
    }
    static var symbol: Polynomial {
        return Polynomial(Coefficient.zero, Coefficient.unit)
    }
}

extension Polynomial: CommutativeSemiring where Coefficient: CommutativeSemiring {
    func value(x: Coefficient) -> Coefficient {
        guard degree >= 0 else {
            return Coefficient.zero
        }
        return self[0] + x * Polynomial(self.dropFirst()).value(x: x)
    }
}

extension Polynomial: UnitalRing where Coefficient: UnitalRing {}

extension Polynomial: CommutativeRing where Coefficient: CommutativeRing {}

extension Polynomial: IntegralDomain where Coefficient: IntegralDomain {}

extension Polynomial: EuclideanDomain where Coefficient: Field {
    static func divideWithRemainder(_ p: Polynomial, _ q: Polynomial) -> (Polynomial, remainder: Polynomial) {
        let (n, m) = (p.degree, q.degree)
        precondition(m >= 0)
        guard n >= m else {
            return (Polynomial.zero, p)
        }
        let r = Polynomial.monomial(coefficient: p[n]/q[m], degree: n - m)
        let (u, v) = Polynomial.divideWithRemainder(p - r * q, q)
        return (r + u, v)
     }

     func monic() -> Polynomial {
         return Polynomial(self.map { $0/self[degree] })
     }
}
