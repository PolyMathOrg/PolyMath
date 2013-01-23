running
testTanh
	| eps |
	eps := 1.0e-6.
	self assert: ((1 + 2 i) tanh - (1 + 2 j k) tanh) abs < eps