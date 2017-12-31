printing
testPolynomialPrintOn
	| poly |
	poly := PMPolynomial coefficients: #(1 0 1).
	self assert: poly printString equals: '1 +  X^2'.
	poly := PMPolynomial coefficients: #(1).
	self assert: poly printString equals: '1'