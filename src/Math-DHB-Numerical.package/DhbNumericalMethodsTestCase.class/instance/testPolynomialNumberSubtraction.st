function evaluation
testPolynomialNumberSubtraction

	| polynomial |
	polynomial := 2 - ( DhbPolynomial coefficients: #(2 -3 1)).
	self should: [ (polynomial at: 0) = 0].
	self should: [ (polynomial at: 1) = 3].
	self should: [ (polynomial at: 2) = -1].
	self should: [ (polynomial at: 3) = 0].