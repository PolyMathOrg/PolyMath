mathematical functions
arcSin
	"Evaluate the arc sine of the receiver."

	| arcSin x one |
	self isZero ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: 16 + nBits.
	x inPlaceAbs.
	one := x one.
	x > one ifTrue: [DomainError signal: 'cannot compute arcSin of a number greater than 1'].
	arcSin := x = one
		ifTrue: [self pi timesTwoPower: -1]
		ifFalse: [self exponent * -4 >= nBits
			ifTrue: [x powerExpansionArcSinPrecision: x numBits]
			ifFalse: [(x / (one - x squared) sqrt) arcTan]].
	self negative ifTrue: [arcSin inPlaceNegated].
	^arcSin asArbitraryPrecisionFloatNumBits: nBits