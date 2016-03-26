tests
testAddPolynomial
	| c poly |
	c := 6 - 6 i.
	poly := DhbPolynomial coefficients: #(1 1 1).
	self assert: (poly + c at: 0) equals: 7 - 6 i.
	self assert: (c + poly at: 0) equals: 7 - 6 i