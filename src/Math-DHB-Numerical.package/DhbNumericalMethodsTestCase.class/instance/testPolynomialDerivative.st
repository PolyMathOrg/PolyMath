function evaluation
testPolynomialDerivative
	"Code example 2.3"
	| polynomial |
	polynomial := ( DhbPolynomial coefficients: #(-3 7 2 1)) derivative.
	self should: [ (polynomial at: 0) = 7].
	self should: [ (polynomial at: 1) = 4].
	self should: [ (polynomial at: 2) = 3].
	self should: [ (polynomial at: 3) = 0].
	self should: [ (polynomial at: 4) = 0].