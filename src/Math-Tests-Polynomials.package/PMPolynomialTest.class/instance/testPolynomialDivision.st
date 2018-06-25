function evaluation
testPolynomialDivision
	| pol1 pol2 polynomial |
	pol1 := PMPolynomial coefficients: #(2 -3 1).
	pol2 := PMPolynomial coefficients: #(-6 23 -20 3 -1 1).
	polynomial := pol2 / pol1.
	self assert: (polynomial at: 0) equals: -3.
	self assert: (polynomial at: 1) equals: 7.
	self assert: (polynomial at: 2) equals: 2.
	self assert: (polynomial at: 3) equals: 1.
	self assert: (polynomial at: 4) equals: 0.
	self assert: (polynomial at: 5) equals: 0.
	self assert: (polynomial at: 6) equals: 0