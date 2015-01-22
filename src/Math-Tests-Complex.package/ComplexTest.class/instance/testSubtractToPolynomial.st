tests
testSubtractToPolynomial
	| c poly |
	poly := DhbPolynomial coefficients: #(1 2 3).
	c := (1 + 3 i).
	self should: [(c - poly  at: 0 ) = 3 i].
	self should: [(poly - c at: 0) = -3 i ].