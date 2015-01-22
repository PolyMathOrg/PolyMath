tests
testDividingPolynomial
	| c poly |
	c := (4 + 4 i).
	poly := DhbPolynomial coefficients: #(1 0 1).
	self should: [(poly / c) = ((1/c) * poly)]
	