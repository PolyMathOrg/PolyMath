running
testCosh
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) cosh - (1 + 2 j k) cosh) abs < eps