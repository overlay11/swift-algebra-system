DIAGRAM
    PROTOCOLS(Monoid, Group, CommutativeMonoid, AbelianGroup, Semiring, Ring,
              Unital, IntegralDomain, EuclideanDomain, Commutative)

    TYPE(Polynomial<Coefficient: Monoid>)
        ATTRIBUTE(degree: Int)
        OPERATION(init([Coefficient]))
        OPERATION(derivative(), Polynomial)
        OPERATION(subscript(Int), Coefficient)
        STATIC OPERATION(monomial(coefficient: Coefficient, degree: Int), Polynomial)
    END

    TYPE(Polynomial<Coefficient: Commutative>)
        OPERATION(value(Coefficient), Coefficient)
    END

    TYPE(Polynomial<Coefficient: Field>)
        OPERATION(monic(), Polynomial)
    END

    GENERALIZATIONS
        "Polynomial<Coefficient: AbelianGroup>" -> {
            "Polynomial<Coefficient: Group>"
            "Polynomial<Coefficient: CommutativeMonoid>"
        } -> "Polynomial<Coefficient: Monoid>"
        "Polynomial<Coefficient: Semiring>" -> "Polynomial<Coefficient: CommutativeMonoid>"
        "Polynomial<Coefficient: Ring>" -> {
            "Polynomial<Coefficient: AbelianGroup>"
            "Polynomial<Coefficient: Semiring>"
        }
        {
            "Polynomial<Coefficient: Unital>"
            "Polynomial<Coefficient: Commutative>"
        } -> "Polynomial<Coefficient: Semiring>"
        "Polynomial<Coefficient: IntegralDomain>" ->  {
            "Polynomial<Coefficient: Ring>"
            "Polynomial<Coefficient: Unital>"
        }
        "Polynomial<Coefficient: Field>" -> {
            "Polynomial<Coefficient: IntegralDomain>"
            "Polynomial<Coefficient: Commutative>"
        }
    END

    IMPLEMENTATIONS
        HORIZONTAL RELATION("Polynomial<Coefficient: Monoid>" -> Monoid)
        HORIZONTAL RELATION("Polynomial<Coefficient: Group>" -> Group)
        HORIZONTAL RELATION("Polynomial<Coefficient: CommutativeMonoid>" -> CommutativeMonoid)
        HORIZONTAL RELATION("Polynomial<Coefficient: AbelianGroup>" -> AbelianGroup)
        HORIZONTAL RELATION("Polynomial<Coefficient: Semiring>" -> Semiring)
        HORIZONTAL RELATION("Polynomial<Coefficient: Ring>" -> Ring)
        HORIZONTAL RELATION("Polynomial<Coefficient: Unital>" -> Unital)
        HORIZONTAL RELATION("Polynomial<Coefficient: Commutative>" -> Commutative)
        HORIZONTAL RELATION("Polynomial<Coefficient: IntegralDomain>" -> IntegralDomain)
        HORIZONTAL RELATION("Polynomial<Coefficient: Field>" -> EuclideanDomain)
    END
END
