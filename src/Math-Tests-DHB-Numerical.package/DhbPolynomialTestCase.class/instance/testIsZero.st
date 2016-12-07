comparing
testIsZero
	| p1 p2 |
	p1 := PMPolynomial coefficients: #(0 0 0 0 0).
	p2 := PMPolynomial coefficients: #(0 0 0 0 1 0 0 0).
	self assert: p1 isZero.
	self shouldnt: [ p2 isZero ]