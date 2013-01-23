running
testRaisedTo
	| eps |
	eps := 1.0e-6.
	self assert: ((q1234 raisedTo: 3) - (q1234 ln * 3) exp) abs < eps.