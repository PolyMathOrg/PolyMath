running
testAddPolynomial
	| poly |
	poly := DhbPolynomial coefficients: #(1 1 1).
	self assert: (poly + q12 at: 0) equals: (2 + 2 i) asQuaternion.
	self assert: (q12 + poly at: 0) equals: (2 + 2 i) asQuaternion