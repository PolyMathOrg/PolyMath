function evaluation
testPolynomialSubtraction

	| polynomial |
	polynomial := ( DhbPolynomial coefficients: #(2 -3 1)) - ( DhbPolynomial coefficients: #(-3 7 2 1)).
	self should: [ (polynomial at: 0) = 5].
	self should: [ (polynomial at: 1) = -10].
	self should: [ (polynomial at: 2) = -1].
	self should: [ (polynomial at: 3) = -1].
	self should: [ (polynomial at: 4) = 0].