arithmetic
naiveRaisedToInteger: n
	"Very naive algorithm: use full precision.
	Use only for small n"
	| m e |
	m := mantissa raisedToInteger: n. 
	e := biasedExponent * n.
	^(m asArbitraryPrecisionFloatNumBits: nBits) timesTwoPower: e
	