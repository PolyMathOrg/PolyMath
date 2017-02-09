function evaluation
testPolynomialNumberDivision
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1)) / 2.
	self assert: (polynomial at: 0) equals: 1.
	self assert: (polynomial at: 1) equals: -3 / 2.
	self assert: (polynomial at: 2) equals: 1 / 2.
	self assert: (polynomial at: 3) equals: 0