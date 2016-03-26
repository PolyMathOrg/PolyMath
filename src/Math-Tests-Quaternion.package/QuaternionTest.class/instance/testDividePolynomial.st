running
testDividePolynomial
	| poly |
	poly := DhbPolynomial coefficients: #(1 1 1).
	self assert: (poly / q12 at: 0) equals: q12 reciprocal.
	self assert: (q12 / poly at: 0) equals: 0.
	poly := poly * q12.
	self assert: ((poly / q12) coefficients allSatisfy: [ :ea | ea = 1 ])