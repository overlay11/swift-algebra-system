protocol VectorSpace: AbelianGroup {
    associatedtype Scalar: Field
    static func * (x: Self, a: Scalar) -> Self
    static func / (x: Self, a: Scalar) -> Self
}

func * <T, U>(a: T, x: U) -> U where U: VectorSpace, T == U.Scalar {
    return x * a
}
