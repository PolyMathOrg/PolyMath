function evaluation
testGammaLow
	| value |
	value := Float pi sqrt / 2.
	self assert: ((3 / 2) gamma - value) abs < 1.0e-14