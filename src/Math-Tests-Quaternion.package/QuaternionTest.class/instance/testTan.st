running
testTan
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) tan - (1 + 2 j k) tan) abs < eps