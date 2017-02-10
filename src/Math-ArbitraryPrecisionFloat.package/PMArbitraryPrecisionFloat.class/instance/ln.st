mathematical functions
ln
	"Answer the neperian logarithm of the receiver."

	| x4 one two p res selfHighRes prec e |
	self <= self zero ifTrue: [DomainError signal: 'ln is only defined for x > 0.0'].
	
	one := self one.
	self = one ifTrue: [^self zero].
	two := one timesTwoPower: 1.

	"Use Salamin algorithm (approximation is good if x is big enough)
		x ln = Pi  / (2 * (1 agm: 4/x) ).
	If x not big enough, compute (x timesTwoPower: p) ln - (2 ln * p)
	if x is close to 1, better use a power expansion"
	prec := nBits + 16.
	e := self exponent.
	e < 0 ifTrue: [e := -1 - e].
	e > prec
		ifTrue: [p := 0]
		ifFalse:
			[p := prec - e.
			prec := prec + p highBit].
	selfHighRes := self asArbitraryPrecisionFloatNumBits: prec.
	(selfHighRes - one) exponent * -4 >= nBits ifTrue: [^(selfHighRes powerExpansionLnPrecision: prec) asArbitraryPrecisionFloatNumBits: nBits].
	self < one ifTrue: [selfHighRes inPlaceReciprocal].	"Use ln(1/x) => - ln(x)"
	x4 := (4 asArbitraryPrecisionFloatNumBits: prec) 
				inPlaceDivideBy: selfHighRes;
				inPlaceTimesTwoPower: p negated.
	res := selfHighRes pi / (one agm: x4) timesTwoPower: -1.
	res := selfHighRes = two 
		ifTrue: [res / (p + 1)]
		ifFalse: [p = 0 ifTrue: [res] ifFalse: [res - ((two asArbitraryPrecisionFloatNumBits: prec) ln * p)]].
	self < one ifTrue: [res inPlaceNegated].
	^res asArbitraryPrecisionFloatNumBits: nBits