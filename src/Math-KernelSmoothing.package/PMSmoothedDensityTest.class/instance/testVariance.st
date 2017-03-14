tests
testVariance
	| v |
	v := density variance.
	self assert: (density standardDeviation equalsTo: v sqrt).
	self assert: density data stdev < v sqrt.
	self assert: (v equalsTo: 0.902934480)