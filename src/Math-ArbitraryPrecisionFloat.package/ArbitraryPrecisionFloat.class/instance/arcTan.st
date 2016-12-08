mathematical functions
arcTan
	"Evaluate the arc tangent of the receiver."

	| x arcTan one power |
	self isZero ifTrue: [^self].
	self > 1
		ifTrue:
			[x := self asArbitraryPrecisionFloatNumBits: nBits * 2 + 2.
			x inPlaceAbs.
			arcTan := (x pi timesTwoPower: -1) - x reciprocal arcTan]
		ifFalse:
			[power := ((nBits bitShift: -1) + self exponent max: 4) highBit.
			x := self asArbitraryPrecisionFloatNumBits: nBits + (1 bitShift: 1 + power).
			x inPlaceAbs.
			one := x one.
			power timesRepeat: [x := x / (one + (one + x squared) sqrt)].
			arcTan := x powerExpansionArcTanPrecision: x numBits + 6.
			arcTan inPlaceTimesTwoPower: power].
	self negative ifTrue: [arcTan inPlaceNegated].
	^arcTan asArbitraryPrecisionFloatNumBits: nBits