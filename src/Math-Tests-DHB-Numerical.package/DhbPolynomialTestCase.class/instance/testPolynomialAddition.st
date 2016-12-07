function evaluation
testPolynomialAddition
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1))
		+ (PMPolynomial coefficients: #(-3 7 2 1)).
	self assert: (polynomial at: 0) equals: -1.
	self assert: (polynomial at: 1) equals: 4.
	self assert: (polynomial at: 2) equals: 3.
	self assert: (polynomial at: 3) equals: 1.
	self assert: (polynomial at: 4) equals: 0