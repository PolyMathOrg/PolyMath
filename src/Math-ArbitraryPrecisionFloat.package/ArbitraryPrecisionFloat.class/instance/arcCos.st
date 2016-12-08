mathematical functions
arcCos
	"Evaluate the arc cosine of the receiver."

	| arcCos x one |
	self isZero ifTrue: [^(self pi timesTwoPower: -1)].
	x := self asArbitraryPrecisionFloatNumBits: 16 + nBits.
	x inPlaceAbs.
	one := x one.
	x > one ifTrue: [DomainError signal: 'cannot compute arcCos of a number greater than 1'].
	arcCos := x = one
		ifTrue: [self zero]
		ifFalse: [((one - x squared) sqrt / x) arcTan].
	self negative ifTrue: [arcCos := x pi - arcCos].
	^arcCos asArbitraryPrecisionFloatNumBits: nBits