accessing
peekSeed
    "Private - Answer the next Integer seed calculated using Lehmer's linear congruential
    method. The seed is in the range 0..16r3FFFFFFF."

    ^ ( seed * 31415821 ) + 1 bitAnd: SmallInteger maxVal