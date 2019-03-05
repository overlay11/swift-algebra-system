DIAGRAM
    PROTOCOLS(Field)

    TYPE(Fraction<T: IntegralDomain>)
        ATTRIBUTE(numerator: T)
        ATTRIBUTE(denominator: T)
        OPERATION(init(T, T))
    END

    IMPLEMENTATIONS
        HORIZONTAL RELATION("Fraction<T: IntegralDomain>" -> Field)
    END
END
