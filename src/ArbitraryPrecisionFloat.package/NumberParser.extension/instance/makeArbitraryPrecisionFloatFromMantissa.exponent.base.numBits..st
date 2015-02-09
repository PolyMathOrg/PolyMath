*ArbitraryPrecisionFloat
makeArbitraryPrecisionFloatFromMantissa: m exponent: k base: aRadix numBits: nBits
	"Convert infinite precision arithmetic into Floating point with prescribed precision."

	^(k positive
		ifTrue: [m * (aRadix raisedToInteger: k)]
		ifFalse: [Fraction numerator: m denominator: (aRadix raisedToInteger: k negated)]) asArbitraryPrecisionFloatNumBits: nBits