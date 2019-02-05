
protocol PolynomialProtocol:
    RandomAccessCollection,
    ExpressibleByArrayLiteral
{
    typealias T = Element
    var degree: Int { get }
    subscript(i: Int) -> T { get }
    init<U>(_ coefficients: U) where U: Sequence, U.Element == T
    init(_ constant: T)
    init()
}

extension PolynomialProtocol {
    var startIndex: Int {
        return 0
    }
    var endIndex: Int {
        return self.degree + 1
    }
    init(arrayLiteral: T...) {
        self.init(arrayLiteral)
    }
    init(_ constant: T) {
        self.init([constant])
    }
    init() {
        self.init([])
    }
}

extension PolynomialProtocol where Element: Equatable {
    static func == (p: Self, q: Self) -> Bool {
        guard p.degree == q.degree else {
            return false
        }
        for (a, b) in zip(p, q) {
            if a != b {
                return false
            }
        }
        return true
    }
}

extension PolynomialProtocol where Element: Semigroup {
    static func + (p: Self, q: Self) -> Self {
        let (n, m) = (p.degree, q.degree)
        let u = zip(p, q).map(+)
        let v = (n > m ? p : q).suffix(abs(n - m))
        return Self(u + v)
    }
}

extension PolynomialProtocol where Element: Monoid {
    var description: String {
        guard self.degree >= 0 else {
            return "\(T.zero)"
        }
        return self
            .enumerated()
            .filter({ (_, coefficient) in coefficient != T.zero })
            .reversed()
            .map({ (i, coefficient) in
                switch i {
                case 0:
                    return "\(coefficient)"
                case 1:
                    return "\(coefficient)*x"
                default:
                    return "\(coefficient)*x**\(i)"
                }
            })
            .joined(separator: " + ")
    }
    static func monomial(coefficient: T, degree: Int) -> Self {
        return Self(Array(repeating: T.zero, count: degree) + [coefficient])
    }
    func derivative() -> Self {
        return Self(
            self.enumerated().dropFirst().map({ (i, a) in a*i })
        )
    }
}

extension PolynomialProtocol where Element: Group {
    static prefix func - (p: Self) -> Self {
        return Self(p.map(-))
    }
}

extension PolynomialProtocol where Element: Ring {
    static func * (p: Self, q: Self) -> Self {
        let (n, m) = (p.degree, q.degree)
        guard n >= 0 && m >= 0 else {
            return Self()
        }
        let r = (0 ... n + m).map({ i in
            (0...i).map({ j in
                let k = i - j
                guard j <= n && k <= m else {
                    return T.zero
                }
                return p[j] * q[k]
            }).reduce(T.zero, +)
        })
        return Self(r)
    }
}

extension PolynomialProtocol where Element: CommutativeRing {
    func value(x: T) -> T {
        guard self.degree >= 0 else {
            return T.zero
        }
        return self[0] + x * Self(self.dropFirst()).value(x: x)
    }
}

extension PolynomialProtocol where Element: UnitalRing {
    static var unit: Self {
        return Self(T.unit)
    }
    static var symbol: Self {
        return Self([T.zero, T.unit])
    }
}

extension PolynomialProtocol where Element: Field {
    static func divideWithRemainder(_ p: Self, _ q: Self) -> (Self, remainder: Self) {
        let (n, m) = (p.degree, q.degree)
        precondition(m >= 0)
        guard n >= m else {
            return (Self(), p)
        }
        let r = Self.monomial(coefficient: p[n]/q[m], degree: n - m)
        let (u, v) = Self.divideWithRemainder(p + -r * q, q)
        return (r + u, v)
     }
}

struct PolynomialOverField<T: Field>:
    PolynomialProtocol,
    CustomStringConvertible,
    EuclideanDomain,
    Extension
{
    var coefficients: [T]
    var degree: Int {
        return self.coefficients.count - 1
    }
    subscript(i: Int) -> T {
        return self.coefficients[i]
    }
    init<U>(_ coefficients: U) where U: Sequence, U.Element == T {
        self.coefficients = Array(coefficients)
        while self.coefficients.last == T.zero {
            self.coefficients.removeLast()
        }
    }
}

typealias Polynomial = PolynomialOverField
