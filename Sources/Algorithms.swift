
func power<T>(_ x: T, _ n: Int, _ f: (T, T) -> T) -> T {
    precondition(n > 0)
    switch n {
    case 1:
        return x
    case let n where n % 2 == 0:
        return power(f(x, x), n / 2, f)
    default:
        return f(x, power(f(x, x), (n - 1) / 2, f))
    }
}
