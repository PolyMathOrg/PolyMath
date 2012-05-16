function evaluation
testPolynomialNumberAdditionInverse

	| polynomial |
	polynomial := ( DhbPolynomial coefficients: #(2 -3 1)) + 2.
	self should: [ (polynomial at: 0) = 4].
	self should: [ (polynomial at: 1) = -3].
	self should: [ (polynomial at: 2) = 1].
	self should: [ (polynomial at: 3) = 0].