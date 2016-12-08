mathematical functions
arSinh
	"Evaluate the area hyperbolic sine of the receiver."

	| arSinh x one |
	self isZero ifTrue: [^self].
	self exponent negated > nBits ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: 16 + nBits.
	x inPlaceAbs.
	self exponent * -4 >= nBits
		ifTrue: [arSinh := x powerExpansionArSinhPrecision: x numBits]
		ifFalse:
			[one := x one.
			arSinh := ((x squared + one) sqrt + x) ln].
	self negative ifTrue: [arSinh inPlaceNegated].
	^arSinh asArbitraryPrecisionFloatNumBits: nBits