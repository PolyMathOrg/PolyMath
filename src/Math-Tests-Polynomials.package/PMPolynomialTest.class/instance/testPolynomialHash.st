comparing
testPolynomialHash
	"polynomial hash is hash of coefficient array"

	| p1 p2 p3 |
	p1 := PMPolynomial coefficients: #(1 0 1).
	p2 := PMPolynomial coefficients: #(1 0 1).
	p3 := PMPolynomial coefficients: #(1 1 1).
	self assert: p1 hash equals: p1 hash.
	self assert: p2 hash equals: p2 hash.
	self shouldnt: [ p3 hash = p1 hash ].
	self shouldnt: [ p3 hash = p2 hash ].
	p3 := p3 - (PMPolynomial coefficients: #(0 1)).
	self assert: p3 hash equals: p2 hash