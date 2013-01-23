running
testTimesPolynomial	
	|  poly |
	poly :=	DhbPolynomial coefficients: #(1 1 1).
	self should: [(poly * q12 at: 0 ) = q12 ].
	self should: [(q12 * poly at: 0) = q12].
	