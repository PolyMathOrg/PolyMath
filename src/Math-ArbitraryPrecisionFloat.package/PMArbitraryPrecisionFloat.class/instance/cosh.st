mathematical functions
cosh
	| e x |
	self isZero ifTrue: [^self one].
	self exponent negated > nBits ifTrue: [^self one].
	x := self asArbitraryPrecisionFloatNumBits: nBits + 16.
	self exponent * -4 >= nBits
		ifTrue: [^(x powerExpansionCoshPrecision: x numBits) asArbitraryPrecisionFloatNumBits: nBits].
	e := x exp.
	^e
		inPlaceAdd: e reciprocal;
		inPlaceTimesTwoPower: -1;
		asArbitraryPrecisionFloatNumBits: nBits