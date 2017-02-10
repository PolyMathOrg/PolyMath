converting
asTrueFraction

	"First remove lowBits from mantissa.
	This can save a useless division and prevent gcd: cost"
	self reduce.
	
	^ biasedExponent >= 0
		ifTrue: [self shift: mantissa by: biasedExponent]
		ifFalse: [
			"Now avoid a painfull GCD: algorihm.
			mantissa is odd and cannot be reduced by a power of two.
				mantissa / (1 bitShift: exponent negated)"
			^ Fraction numerator: mantissa denominator: (1 bitShift: biasedExponent negated)]