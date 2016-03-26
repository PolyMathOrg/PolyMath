estimation
testLinearRegression
	"Code example 10.5"

	| linReg estimation |
	linReg := DhbLinearRegression new.
	linReg
		add: 1 @ 0.72;
		add: 2 @ 3.25;
		add: 3 @ 5.75;
		add: 4 @ 8.21;
		add: 5 @ 10.71;
		add: 6 @ 13.38;
		add: 7 @ 15.82;
		add: 8 @ 18.39;
		add: 9 @ 20.72;
		add: 10 @ 23.38.
	self assert: (linReg slope - 2.514727272727) abs < 0.000000000001.
	self assert: (linReg intercept + 1.798) abs < 0.000000000001.
	self
		assert: (linReg correlationCoefficient - 0.999966922113) abs < 0.000000000001.
	estimation := linReg asEstimatedPolynomial.
	self
		assert: ((estimation value: 4.5) - 9.5182727272727) abs < 0.000000000001.
	self
		assert: ((estimation value: 7.15) - 16.1823) abs < 0.000000000001