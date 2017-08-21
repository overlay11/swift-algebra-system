
postfix operator *

protocol InvolutiveRing: Ring {
    static postfix func * (x: Self) -> Self
}
