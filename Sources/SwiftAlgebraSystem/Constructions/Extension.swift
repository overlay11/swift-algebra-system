protocol Extension: Ring {
    associatedtype T
    init(_ a: T)
}

extension Extension {
    static func + (x: Self, a: T) -> Self {
        return x + Self(a)
    }
    static func - (x: Self, a: T) -> Self {
        return x - Self(a)
    }
    static func * (x: Self, a: T) -> Self {
        return x * Self(a)
    }
    static func == (x: Self, a: T) -> Bool {
        return x == Self(a)
    }
}

func + <T, U>(a: T, x: U) -> U where U: Extension, T == U.T {
    return U(a) + x
}

func - <T, U>(a: T, x: U) -> U where U: Extension, T == U.T {
    return U(a) - x
}

func * <T, U>(a: T, x: U) -> U where U: Extension, T == U.T {
    return U(a) * x
}

func == <T, U>(a: T, x: U) -> Bool where U: Extension, T == U.T {
    return U(a) == x
}
