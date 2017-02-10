mathematical functions
sinh
	| e x |
	self isZero ifTrue: [^self].
	self exponent negated > nBits ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: nBits + 16.
	self exponent * -4 >= nBits
		ifTrue: [^(x powerExpansionSinhPrecision: x numBits) asArbitraryPrecisionFloatNumBits: nBits].
	e := x exp.
	^e
		inPlaceSubtract: e reciprocal;
		inPlaceTimesTwoPower: -1;
		asArbitraryPrecisionFloatNumBits: nBits