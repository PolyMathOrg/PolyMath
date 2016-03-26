printing
testPolynomialPrintOn
	| poly |
	poly := DhbPolynomial coefficients: #(1 0 1).
	self assert: poly printString equals: '1 +  X^2'.
	poly := DhbPolynomial coefficients: #(1).
	self assert: poly printString equals: '1'