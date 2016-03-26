function evaluation
testPolynomialDerivative
	"Code example 2.3"

	| polynomial |
	polynomial := (DhbPolynomial coefficients: #(-3 7 2 1)) derivative.
	self assert: (polynomial at: 0) equals: 7.
	self assert: (polynomial at: 1) equals: 4.
	self assert: (polynomial at: 2) equals: 3.
	self assert: (polynomial at: 3) equals: 0.
	self assert: (polynomial at: 4) equals: 0