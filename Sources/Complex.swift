
protocol ComplexEuclideanDomain: EuclideanDomain, UnitalRing, CustomStringConvertible {
    associatedtype T
    var re: T { get }
    var im: T { get }
    var norm: T { get }
    static var imaginaryUnit: Self { get }
    init(_ re: T, _ im: T)
    init(_ re: T)
}

extension ComplexEuclideanDomain {
    var description: String {
        return "i * \(im) + \(re)"
    }
    static func + (x: Self, y: T) -> Self {
        return x + Self.init(y)
    }
    static func - (x: Self, y: T) -> Self {
        return x - Self.init(y)
    }
    static func * (x: Self, y: T) -> Self {
        return x * Self.init(y)
    }
}

extension ComplexEuclideanDomain where T: UnitalRing & EuclideanDomain {
    var norm: T {
        return re ** 2 + im ** 2
    }
    static func == (x: Self, y: Self) -> Bool {
        return x.re == y.re && x.im == y.im
    }
    static func + (x: Self, y: Self) -> Self {
        return Self.init(x.re + y.re, x.im + y.im)
    }
    static var zero: Self {
        return Self.init(T.zero, T.zero)
    }
    static prefix func - (x: Self) -> Self {
        return Self.init(-x.re, -x.im)
    }
    static func * (x: Self, y: Self) -> Self {
        let re = x.re * y.re - x.im * y.im
        let im = x.im * y.re + x.re * y.im
        return Self.init(re, im)
    }
    static var unit: Self {
        return Self.init(T.unit, T.zero)
    }
    var degree: Int {
        fatalError("Not Implemented")
    }
    static func divideWithRemainder(_ x: Self, _ y: Self) -> (Self, remainder: Self) {
        fatalError("Not Implemented")
    }
    static var imaginaryUnit: Self {
        return Self.init(T.zero, T.unit)
    }
}

struct Complex_EuclideanDomain<T: UnitalRing & EuclideanDomain>: ComplexEuclideanDomain {
    var re: T
    var im: T
    init(_ re: T, _ im: T) {
        self.re = re
        self.im = im
    }
    init(_ re: T) {
        self.re = re
        self.im = T.zero
    }
}

protocol ComplexField: ComplexEuclideanDomain, Field { }

extension ComplexField where T: Field {
    static func / (x: Self, y: Self) -> Self {
        let r = y.re ** 2 + y.im ** 2
        let re = (x.re * y.re + x.im * y.im) / r
        let im = (x.im * y.re - x.re * y.im) / r
        return Self.init(re, im)
    }
    static func / (x: Self, y: T) -> Self {
        return x / Self.init(y)
    }
    static func divideWithRemainder(_ x: Self, _ y: Self) -> (Self, remainder: Self) {
        return (x / y, Self.zero)
    }
    var degree: Int {
        return self == Self.zero ? 0 : 1
    }
}

struct Complex_Field<T: Field>: ComplexField {
    var re: T
    var im: T
    init(_ re: T, _ im: T) {
        self.re = re
        self.im = im
    }
    init(_ re: T) {
        self.re = re
        self.im = T.zero
    }
}

typealias GaussianInt = Complex_EuclideanDomain<Int>
typealias Complex = Complex_Field<Double>
