function evaluation
testPolynomialNumberDivision

	| polynomial |
	polynomial := ( DhbPolynomial coefficients: #(2 -3 1)) / 2.
	self should: [ (polynomial at: 0) = 1].
	self should: [ (polynomial at: 1) = (-3 / 2)].
	self should: [ (polynomial at: 2) = (1/2)].
	self should: [ (polynomial at: 3) = 0].