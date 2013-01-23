function evaluation
testPolynomialDivision

	| pol1 pol2 polynomial |
	pol1 := DhbPolynomial coefficients: #(2 -3 1).
	pol2 := DhbPolynomial coefficients: #(-6 23 -20 3 -1 1).
	polynomial := pol2 / pol1.
	self should: [ (polynomial at: 0) = -3].
	self should: [ (polynomial at: 1) = 7].
	self should: [ (polynomial at: 2) = 2].
	self should: [ (polynomial at: 3) = 1].
	self should: [ (polynomial at: 4) = 0].
	self should: [ (polynomial at: 5) = 0].
	self should: [ (polynomial at: 6) = 0].