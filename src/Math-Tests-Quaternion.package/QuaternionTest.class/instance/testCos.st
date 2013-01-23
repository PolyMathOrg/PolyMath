running
testCos
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 cos - ((q1234 real cos * q1234 unreal cos) - (q1234 real sin * q1234 unreal sin))) abs < eps.
	self assert: ((1 + 2 i) cos - (1 + 2 j k) cos) abs < eps.