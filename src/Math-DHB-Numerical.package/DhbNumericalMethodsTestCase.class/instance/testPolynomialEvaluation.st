function evaluation
testPolynomialEvaluation
	"Code example 2.2"
	| polynomial |
	polynomial := DhbPolynomial coefficients: #(2 -3 1).
	self should: [0 = (polynomial value: 1)].