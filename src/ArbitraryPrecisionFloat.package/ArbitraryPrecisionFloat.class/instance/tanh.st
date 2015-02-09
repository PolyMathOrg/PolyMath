mathematical functions
tanh
	| e x ep one |
	self isZero ifTrue: [^self].
	self exponent negated > nBits ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: nBits + 16.
	self exponent * -4 >= nBits
		ifTrue: [^(x powerExpansionTanhPrecision: x numBits) asArbitraryPrecisionFloatNumBits: nBits].
	e := x exp.
	one :=x one.
	e inPlaceMultiplyBy: e.
	ep := e + one.
	^e
		inPlaceSubtract: one;
		inPlaceDivideBy: ep;
		asArbitraryPrecisionFloatNumBits: nBits