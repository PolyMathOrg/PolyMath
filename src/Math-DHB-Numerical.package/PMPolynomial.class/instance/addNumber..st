double dispatching
addNumber: aNumber
	| newCoefficients |
	newCoefficients := coefficients reverse.
	newCoefficients at: 1 put: newCoefficients first + aNumber.
	^ self class coefficients: newCoefficients