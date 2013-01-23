comparing
testIsZero
	| p1 p2 |
	p1 := DhbPolynomial coefficients: #(0 0 0 0 0).
	p2 := DhbPolynomial coefficients: #(0 0 0 0 1 0 0 0).
	self should: [p1 isZero ].
	self shouldnt: [p2 isZero ].