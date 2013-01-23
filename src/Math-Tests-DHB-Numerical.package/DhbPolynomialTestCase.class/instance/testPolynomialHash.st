comparing
testPolynomialHash
	"polynomial hash is hash of coefficient array"
	| p1 p2 p3 |
	p1 := DhbPolynomial coefficients: #(1 0 1).
	p2 := DhbPolynomial coefficients: #(1 0 1).
	p3 := DhbPolynomial coefficients: #(1 1 1).
	self should: [p1 hash = p1 hash].
	self should: [p2 hash = p2 hash].
	self shouldnt: [p3 hash = p1 hash].
	self shouldnt: [p3 hash = p2 hash].
	p3 := p3 - (DhbPolynomial  coefficients: #(0 1)).
	self should: [p3 hash = p2 hash].