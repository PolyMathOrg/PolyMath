mathematical functions
arCosh
	"Evaluate the area hyperbolic cosine of the receiver."

	| arCosh x one y two |
	x := self asArbitraryPrecisionFloatNumBits: 16 + nBits.
	one := x one.
	x < one ifTrue: [DomainError signal: 'cannot compute arCosh of a number less than 1'].
	x = one ifTrue: [^self zero].
	y := x - one.
	y < one
		ifTrue:
			[y exponent * -4 >= nBits
				ifTrue: [arCosh := (y powerExpansionArCoshp1Precision: y numBits) * (y timesTwoPower: 1) sqrt]
				ifFalse:
					[two := one timesTwoPower: 1.
					arCosh := ((y * (y + two)) sqrt + y + one) ln]]
		ifFalse: [arCosh := ((x squared - one) sqrt + x) ln].
	^arCosh asArbitraryPrecisionFloatNumBits: nBits