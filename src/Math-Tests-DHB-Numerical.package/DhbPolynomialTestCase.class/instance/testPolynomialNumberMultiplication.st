function evaluation
testPolynomialNumberMultiplication

	| polynomial |
	polynomial := 2 * ( DhbPolynomial coefficients: #(2 -3 1)).
	self should: [ (polynomial at: 0) = 4].
	self should: [ (polynomial at: 1) = -6].
	self should: [ (polynomial at: 2) = 2].
	self should: [ (polynomial at: 3) = 0].