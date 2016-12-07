running
testSubtractPolynomial
	| poly |
	poly := PMPolynomial coefficients: #(1 1 1).
	self assert: (poly - q12 at: 0) equals: (0 - 2 i) asQuaternion.
	self assert: (q12 - poly at: 0) equals: (0 + 2 i) asQuaternion