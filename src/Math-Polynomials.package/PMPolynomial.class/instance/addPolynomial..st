double dispatching
addPolynomial: aPolynomial
	
	^self class coefficients: ( ( 0 to: (self degree max: aPolynomial degree)) collect: [ :n | ( aPolynomial at: n) + ( self at: n)])