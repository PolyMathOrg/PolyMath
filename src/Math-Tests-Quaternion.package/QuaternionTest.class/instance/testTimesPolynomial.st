running
testTimesPolynomial
	| poly |
	poly := DhbPolynomial coefficients: #(1 1 1).
	self assert: (poly * q12 at: 0) equals: q12.
	self assert: (q12 * poly at: 0) equals: q12