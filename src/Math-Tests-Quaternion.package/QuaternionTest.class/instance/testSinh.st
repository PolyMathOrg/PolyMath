running
testSinh
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) sinh - (1 + 2 j k) sinh) abs < eps