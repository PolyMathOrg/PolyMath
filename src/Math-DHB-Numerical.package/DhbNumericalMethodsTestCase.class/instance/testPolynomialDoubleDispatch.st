arithmetic
testPolynomialDoubleDispatch
	| n p |
	n := 3.2.
	p := DhbPolynomial coefficients: #(1 0 1).
	self should: [(p + n) = (n + p)].
	self should: [(p * n )= (n * p)].
	n := 3.
	self should: [(p + n) = (n + p)].
	self should: [(p * n )= (n * p)].
	self shouldnt: [(n - p) = (p - n)].
	self should: [(n - p) = ((p - n) * -1) ].
	n := ( 1 / 2).
	self should: [n + p = (p + n)].
	self should: [n - p = (p - n)  negated].