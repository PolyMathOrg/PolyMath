tests
testTimesPolynomial
	| c poly |
	c := 1 + 1 i.
	poly := DhbPolynomial coefficients: #( 1 ).
	self should: [(c * poly at: 0) = c ].
	self should: [(poly * c at: 0) = c ].
	