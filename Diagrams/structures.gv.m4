DIAGRAM
    PROTOCOL(Equatable)
    END

    PACKAGE(GroupLike)
        PROTOCOL(Semigroup)
            ABSTRACT STATIC OPERATION(+(Self, Self), Self)
            STATIC OPERATION(*(Self, Int), Self)
        END

        PROTOCOL(CommutativeSemigroup)
        END

        PROTOCOL(Monoid)
            STATIC ATTRIBUTE(zero: Self)
            ABSTRACT OPERATION(init())
        END

        PROTOCOL(CommutativeMonoid)
        END

        PROTOCOL(Group)
            ABSTRACT STATIC OPERATION(prefix -(Self), Self)
            STATIC OPERATION(-(Self, Self), Self)
        END

        PROTOCOL(AbelianGroup)
        END

        GENERALIZATIONS
            CommutativeMonoid -> { Monoid CommutativeSemigroup } -> Semigroup
            Group -> Monoid
            AbelianGroup -> { Group CommutativeMonoid }
        END
    END

    PACKAGE(RingLike)
        PROTOCOL(Semiring)
            ABSTRACT STATIC OPERATION(*(Self, Self), Self)
            STATIC OPERATION(**(Self, Int), Self)
        END

        PROTOCOL(Unital(Semiring))
            ABSTRACT STATIC ATTRIBUTE(unit: Self)
        END

        PROTOCOL(Commutative(Semiring))
        END

        PROTOCOL(Ring)
        END

        PROTOCOL(InvolutiveRing)
            ABSTRACT STATIC OPERATION(postfix *(Self), Self)
        END

        PROTOCOL(TriviallyInvolutiveRing)
            STATIC OPERATION(postfix *(Self), Self)
        END

        PROTOCOL(IntegralDomain)
        END

        PROTOCOL(DivisionRing)
            ABSTRACT STATIC OPERATION(/(Self, Self), Self)
            ATTRIBUTE(inversed: Self)
        END

        PROTOCOL(EuclideanDomain)
            ABSTRACT STATIC OPERATION(divideWithRemainder(Self, Self), (Self, Self))
            STATIC OPERATION(%(Self, Self), Self)
            STATIC OPERATION(/%(Self, Self), Self)
            STATIC OPERATION(greatestCommonDivisor(Self, Self), Self)
        END

        PROTOCOL(Field)
            STATIC OPERATION(divideWithRemainder(Self, Self), (Self, Self))
        END

        GENERALIZATIONS
            { "Unital(Semiring)" "Commutative(Semiring)" Ring } -> Semiring
            InvolutiveRing -> Ring
            TriviallyInvolutiveRing -> InvolutiveRing
            Field -> DivisionRing -> { Ring "Unital(Semiring)" }
            Field -> EuclideanDomain -> IntegralDomain -> { Ring "Commutative(Semiring)" "Unital(Semiring)" }
        END
    END

    PACKAGE(Spaces)
        PROTOCOL(VectorSpace<T: Field>)
            ABSTRACT STATIC OPERATION(*(Self, T), Self)
            ABSTRACT STATIC OPERATION(/(Self, T), Self)
        END

        PROTOCOL(MetricSpace)
            ABSTRACT STATIC OPERATION(metric(Self, Self), Double)
        END

        PROTOCOL(NormedSpace)
            ABSTRACT ATTRIBUTE(norm: Double)
            ABSTRACT ATTRIBUTE(squaredNorm: Double)
            STATIC OPERATION(metric(Self, Self), Double)
        END

        PROTOCOL(NormedVectorSpace)
        END

        PROTOCOL(EuclideanSpace)
            ABSTRACT STATIC OPERATION(**(Self, Self), Double)
            ATTRIBUTE(norm: Double)
            ATTRIBUTE(squaredNorm: Double)
        END

        GENERALIZATIONS
            NormedSpace -> { MetricSpace AbelianGroup }
            EuclideanSpace -> NormedVectorSpace -> { "VectorSpace<T: Field>" NormedSpace }
        END
    END

    GENERALIZATIONS
        Semigroup -> Equatable
        Semiring -> CommutativeMonoid
        Ring -> AbelianGroup
        "VectorSpace<T: Field>" -> AbelianGroup
    END

    DEPENDENCIES
        WEAK RELATION("VectorSpace<T: Field>" -> Field)
    END
END
