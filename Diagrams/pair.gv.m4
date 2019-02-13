DIAGRAM
    GENERALIZATIONS
        "Pair<T: AbelianGroup>" -> "Pair<T: Group>" -> "Pair<T: CommutativeMonoid>" -> "Pair<T: Monoid>"
        "Pair<T: TriviallyInvolutiveRing>" -> "Pair<T: InvolutiveRing>" -> "Pair<T: AbelianGroup>"
        "Pair<T: NormedSpace>" -> "Pair<T: AbelianGroup>"
        "Pair<T: DivisionRing & InvolutiveRing>" -> "Pair<T: UnitalRing & InvolutiveRing>" -> "Pair<T: InvolutiveRing>"
        "Pair<T: Field & TriviallyInvolutiveRing>" -> {
            "Pair<T: TriviallyInvolutiveRing>"
            "Pair<T: DivisionRing & InvolutiveRing>"
        }
    END

    IMPLEMENTATIONS
        HORIZONTAL RELATION("Pair<T: Monoid>" -> Monoid)
        HORIZONTAL RELATION("Pair<T: CommutativeMonoid>" -> CommutativeMonoid)
        HORIZONTAL RELATION("Pair<T: Group>" -> Group)
        HORIZONTAL RELATION("Pair<T: AbelianGroup>" -> AbelianGroup)
        HORIZONTAL RELATION("Pair<T: InvolutiveRing>" -> InvolutiveRing)
        HORIZONTAL RELATION("Pair<T: UnitalRing & InvolutiveRing>" -> UnitalRing)
        HORIZONTAL RELATION("Pair<T: DivisionRing & InvolutiveRing>" -> DivisionRing)
        HORIZONTAL RELATION("Pair<T: TriviallyInvolutiveRing>" -> CommutativeRing)
        HORIZONTAL RELATION("Pair<T: Field & TriviallyInvolutiveRing>" -> Field)
        HORIZONTAL RELATION("Pair<T: NormedSpace>" -> NormedSpace)
    END
END
