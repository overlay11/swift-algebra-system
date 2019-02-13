DIAGRAM
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
            "Polynomial<Coefficient: UnitalSemiring>"
            "Polynomial<Coefficient: CommutativeSemiring>"
        } -> "Polynomial<Coefficient: Semiring>"
        "Polynomial<Coefficient: UnitalRing>" -> {
            "Polynomial<Coefficient: UnitalSemiring>"
            "Polynomial<Coefficient: Ring>"
        }
        "Polynomial<Coefficient: CommutativeRing>" -> {
            "Polynomial<Coefficient: Ring>"
            "Polynomial<Coefficient: CommutativeSemiring>"
        }
        "Polynomial<Coefficient: IntegralDomain>" -> "Polynomial<Coefficient: UnitalRing>"
        "Polynomial<Coefficient: Field>" -> {
            "Polynomial<Coefficient: IntegralDomain>"
            "Polynomial<Coefficient: CommutativeRing>"
        }
    END

    IMPLEMENTATIONS
        HORIZONTAL RELATION("Polynomial<Coefficient: Monoid>" -> Monoid)
        HORIZONTAL RELATION("Polynomial<Coefficient: Group>" -> Group)
        HORIZONTAL RELATION("Polynomial<Coefficient: CommutativeMonoid>" -> CommutativeMonoid)
        HORIZONTAL RELATION("Polynomial<Coefficient: AbelianGroup>" -> AbelianGroup)
        HORIZONTAL RELATION("Polynomial<Coefficient: Semiring>" -> Semiring)
        HORIZONTAL RELATION("Polynomial<Coefficient: Ring>" -> Ring)
        HORIZONTAL RELATION("Polynomial<Coefficient: UnitalSemiring>" -> UnitalSemiring)
        HORIZONTAL RELATION("Polynomial<Coefficient: CommutativeSemiring>" -> CommutativeSemiring)
        HORIZONTAL RELATION("Polynomial<Coefficient: UnitalRing>" -> UnitalRing)
        HORIZONTAL RELATION("Polynomial<Coefficient: CommutativeRing>" -> CommutativeRing)
        HORIZONTAL RELATION("Polynomial<Coefficient: IntegralDomain>" -> IntegralDomain)
        HORIZONTAL RELATION("Polynomial<Coefficient: Field>" -> EuclideanDomain)
    END
END
