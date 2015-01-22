tests
testAddPolynomial	
	| c  poly |
	c := (6 - 6 i).
	poly :=	DhbPolynomial coefficients: #(1 1 1).
	self should: [(poly + c at: 0 ) = (7 - 6 i)].
	self should: [(c + poly at: 0) = (7 - 6 i) ].