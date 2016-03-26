function evaluation
testPolynomialSubtraction
	| polynomial |
	polynomial := (DhbPolynomial coefficients: #(2 -3 1))
		- (DhbPolynomial coefficients: #(-3 7 2 1)).
	self assert: (polynomial at: 0) equals: 5.
	self assert: (polynomial at: 1) equals: -10.
	self assert: (polynomial at: 2) equals: -1.
	self assert: (polynomial at: 3) equals: -1.
	self assert: (polynomial at: 4) equals: 0