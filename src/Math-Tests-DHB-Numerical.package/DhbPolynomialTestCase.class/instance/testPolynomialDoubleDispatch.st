arithmetic
testPolynomialDoubleDispatch
	| n p |
	n := 3.2.
	p := DhbPolynomial coefficients: #(1 0 1).
	self assert: p + n equals: n + p.
	self assert: p * n equals: n * p.
	n := 3.
	self assert: p + n equals: n + p.
	self assert: p * n equals: n * p.
	self shouldnt: [ n - p = (p - n) ].
	self assert: n - p equals: (p - n) * -1.
	n := 1 / 2.
	self assert: n + p equals: p + n.
	self assert: n - p equals: (p - n) negated