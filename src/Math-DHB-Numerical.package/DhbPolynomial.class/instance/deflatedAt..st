creation
deflatedAt: aNumber
		"Answers a new polynomial quotient of the receiver with polynomial (X-aNumber)
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 20/4/99 "
	| remainder next newCoefficients|
	remainder := 0.
	newCoefficients := coefficients collect:
						[ :each |
						  next := remainder. 
						  remainder := remainder * aNumber + each.
						  next].
	^self class coefficients: ( newCoefficients copyFrom: 2 to: newCoefficients size) reverse