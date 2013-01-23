running
testFunctions
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 ln exp - q1234) abs < eps