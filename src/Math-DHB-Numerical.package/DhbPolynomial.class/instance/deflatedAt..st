creation
deflatedAt: aNumber
	"Answers a new polynomial quotient of the receiver with polynomial (X-aNumber)"
	| remainder next newCoefficients |
	remainder := 0.
	newCoefficients := coefficients collect:
						[ :each |
						  next := remainder. 
						  remainder := remainder * aNumber + each.
						  next].
	^self class coefficients: ( newCoefficients copyFrom: 2 to: newCoefficients size) reverse