DIAGRAM
    PROTOCOLS(Monoid, CommutativeMonoid, Group, AbelianGroup, InvolutiveRing,
              Unital, DivisionRing, Commutative, Field, NormedSpace)

    TYPE(Pair<T: Monoid>)
        ATTRIBUTE(re: T)
        ATTRIBUTE(im: T)
        OPERATION(init(T, T))
    END

    TYPE(Pair<T: InvolutiveRing & Unital>)
        STATIC ATTRIBUTE(symbol: Pair)
    END

    TYPE(Pair<T: DivisionRing & InvolutiveRing>)
        STATIC OPERATION(/(Pair, T), Pair)
    END

    TYPE(Pair<Complex>)
        OPERATION(init(Double, Double, Double, Double))
    END

    GENERALIZATIONS
        "Pair<T: AbelianGroup>" -> { "Pair<T: Group>" "Pair<T: CommutativeMonoid>" } -> "Pair<T: Monoid>"
        "Pair<T: TriviallyInvolutiveRing>" -> "Pair<T: InvolutiveRing>" -> "Pair<T: AbelianGroup>"
        "Pair<T: Field & NormedSpace>" -> "Pair<T: DivisionRing & InvolutiveRing>"
        "Pair<T: DivisionRing & InvolutiveRing>" -> "Pair<T: InvolutiveRing & Unital>" -> "Pair<T: InvolutiveRing>"
        "Pair<Double>" -> "Pair<T: Field & TriviallyInvolutiveRing>" -> {
            "Pair<T: TriviallyInvolutiveRing>"
            "Pair<T: DivisionRing & InvolutiveRing>"
        }
        { "Pair<Complex>" "Pair<Double>" } -> "Pair<T: Field & NormedSpace>"
    END

    BIDIRECTIONAL GENERALIZATIONS
        HORIZONTAL RELATION(Complex -> "Pair<Double>")
        HORIZONTAL RELATION(Quaternion -> "Pair<Complex>")
    END

    DEPENDENCIES
        "Pair<Complex>" -> Complex
    END

    IMPLEMENTATIONS
        HORIZONTAL RELATION("Pair<T: Monoid>" -> Monoid)
        HORIZONTAL RELATION("Pair<T: CommutativeMonoid>" -> CommutativeMonoid)
        HORIZONTAL RELATION("Pair<T: Group>" -> Group)
        HORIZONTAL RELATION("Pair<T: AbelianGroup>" -> AbelianGroup)
        HORIZONTAL RELATION("Pair<T: InvolutiveRing>" -> InvolutiveRing)
        HORIZONTAL RELATION("Pair<T: InvolutiveRing & Unital>" -> Unital)
        HORIZONTAL RELATION("Pair<T: DivisionRing & InvolutiveRing>" -> DivisionRing)
        HORIZONTAL RELATION("Pair<T: TriviallyInvolutiveRing>" -> Commutative)
        HORIZONTAL RELATION("Pair<T: Field & TriviallyInvolutiveRing>" -> Field)
        HORIZONTAL RELATION("Pair<T: Field & NormedSpace>" -> NormedSpace)
    END
END
