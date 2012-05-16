double dispatching
addNumber: aNumber
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 19/4/99 "
	| newCoefficients |
	newCoefficients := coefficients reverse.
	newCoefficients at: 1 put: newCoefficients first + aNumber.
	^self class coefficients: newCoefficients