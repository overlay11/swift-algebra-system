
protocol TriviallyInvolutiveRing: InvolutiveRing { }

extension TriviallyInvolutiveRing {
    static postfix func * (x: Self) -> Self {
        return x
    }
}

extension Double: TriviallyInvolutiveRing { }
