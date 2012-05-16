double dispatching
subtractFrom: aNumber
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 19/4/99 "
	| newCoefficients |
	newCoefficients := ( coefficients collect: [ :c | c negated]) reverse.
	newCoefficients at: 1 put: newCoefficients first + aNumber.
	^self class coefficients: newCoefficients