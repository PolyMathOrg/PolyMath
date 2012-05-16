double dispatching
subtractToPolynomial: aPolynomial
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 19/4/99 "
	^self class coefficients: ( ( 0 to: (self degree max: aPolynomial degree)) collect: [ :n | ( aPolynomial at: n) - ( self at: n)])