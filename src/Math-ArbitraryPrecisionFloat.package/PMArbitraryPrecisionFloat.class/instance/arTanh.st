mathematical functions
arTanh
	"Evaluate the area hyperbolic tangent of the receiver."

	| arTanh x one |
	self isZero ifTrue: [^self].
	x := self asArbitraryPrecisionFloatNumBits: 16 + nBits.
	x inPlaceAbs.
	one := x one.
	x >= one ifTrue: [DomainError signal: 'cannot evaluate arTanh of number of magnitude >= 1'].
	self exponent * -4 >= nBits
		ifTrue: [arTanh := x powerExpansionArTanhPrecision: x numBits]
		ifFalse:
			[arTanh := ((one + x) / (one - x)) ln.
			arTanh inPlaceTimesTwoPower: -1].
	self negative ifTrue: [arTanh inPlaceNegated].
	^arTanh asArbitraryPrecisionFloatNumBits: nBits