private
sin: x
	"Evaluate the sine of x by sin(5x) formula and power series expansion."
	
	| sin sin2 sin4 fifth five |
	x isZero ifTrue: [^x zero].
	five := 5 asArbitraryPrecisionFloatNumBits: x numBits.
	fifth := x / five.
	sin := fifth powerExpansionSinPrecision: nBits + 8.
	sin2 := sin squared.
	sin2 inPlaceTimesTwoPower: 2.
	sin4 := sin2 squared.
	sin2 inPlaceMultiplyBy: five.
	^sin4
		inPlaceSubtract: sin2;
		inPlaceAdd: five;
		inPlaceMultiplyBy: sin;
		yourself