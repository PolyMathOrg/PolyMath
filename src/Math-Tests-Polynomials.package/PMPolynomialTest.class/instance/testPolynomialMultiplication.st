function evaluation
testPolynomialMultiplication
	"Code example 2.3"

	| pol1 pol2 polynomial |
	pol1 := PMPolynomial coefficients: #(2 -3 1).
	pol2 := PMPolynomial coefficients: #(-3 7 2 1).
	polynomial := pol1 * pol2.
	self assert: (polynomial at: 0) equals: -6.
	self assert: (polynomial at: 1) equals: 23.
	self assert: (polynomial at: 2) equals: -20.
	self assert: (polynomial at: 3) equals: 3.
	self assert: (polynomial at: 4) equals: -1.
	self assert: (polynomial at: 5) equals: 1.
	self assert: (polynomial at: 6) equals: 0