running
testLn
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) ln - (1 + 2 j k) ln) abs < eps