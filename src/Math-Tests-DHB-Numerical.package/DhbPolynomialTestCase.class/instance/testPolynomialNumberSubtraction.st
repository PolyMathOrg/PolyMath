function evaluation
testPolynomialNumberSubtraction
	| polynomial |
	polynomial := 2 - (DhbPolynomial coefficients: #(2 -3 1)).
	self assert: (polynomial at: 0) equals: 0.
	self assert: (polynomial at: 1) equals: 3.
	self assert: (polynomial at: 2) equals: -1.
	self assert: (polynomial at: 3) equals: 0