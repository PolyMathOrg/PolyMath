function evaluation
testPolynomialIntegralWithConstant
	"Code example 2.3"

	| polynomial |
	polynomial := (PMPolynomial coefficients: #(-3 7 2 1)) integral: 5.
	self assert: (polynomial at: 0) equals: 5.
	self assert: (polynomial at: 1) equals: -3.
	self assert: (polynomial at: 2) equals: 7 / 2.
	self assert: (polynomial at: 3) equals: 2 / 3.
	self assert: (polynomial at: 4) equals: 1 / 4.
	self assert: (polynomial at: 5) equals: 0