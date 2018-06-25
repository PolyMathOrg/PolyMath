function evaluation
testPolynomialNumberMultiplicationInverse
	| polynomial |
	polynomial := (PMPolynomial coefficients: #(2 -3 1)) * 2.
	self assert: (polynomial at: 0) equals: 4.
	self assert: (polynomial at: 1) equals: -6.
	self assert: (polynomial at: 2) equals: 2.
	self assert: (polynomial at: 3) equals: 0