iterative algorithms
testIncompleteBetaFunction
	| function |
	function := DhbIncompleteBetaFunction shape: 2 shape: 5.
	self assert: ((function value: 0.8) - 0.9984) abs < 0.00001