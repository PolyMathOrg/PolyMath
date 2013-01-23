function evaluation
testPolynomialMultiplication
	"Code example 2.3"
	| pol1 pol2 polynomial |
	pol1 := DhbPolynomial coefficients: #(2 -3 1).
	pol2 := DhbPolynomial coefficients: #(-3 7 2 1).
	polynomial := pol1 * pol2.
	self should: [ (polynomial at: 0) = -6].
	self should: [ (polynomial at: 1) = 23].
	self should: [ (polynomial at: 2) = -20].
	self should: [ (polynomial at: 3) = 3].
	self should: [ (polynomial at: 4) = -1].
	self should: [ (polynomial at: 5) = 1].
	self should: [ (polynomial at: 6) = 0].