function evaluation
testPolynomialEvaluation
	"Code example 2.2"

	| polynomial |
	polynomial := PMPolynomial coefficients: #(2 -3 1).
	self assert: 0 equals: (polynomial value: 1)