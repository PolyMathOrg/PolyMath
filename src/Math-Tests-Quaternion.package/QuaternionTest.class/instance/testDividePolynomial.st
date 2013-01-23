running
testDividePolynomial	
	|  poly |
	poly :=	DhbPolynomial coefficients: #(1 1 1).
	self should: [(poly / q12 at: 0 ) = q12 reciprocal ].
	self should: [(q12 / poly at: 0) = 0].
	poly := poly * q12.
	self should: [(poly / q12) coefficients allSatisfy: [:ea | ea = 1]]
	