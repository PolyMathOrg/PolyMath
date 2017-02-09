function evaluation
testGammaNegative
	| value |
	value := Float pi / (1.5 gamma * (Float pi / -2) sin).
	self assert: ((-1 / 2) gamma - value) abs < 1.0e-14