running
testSin
	| eps |
	eps := 1.0e-6.
	self assert: (q1234 sin - ((q1234 real sin * q1234 unreal cos) + (q1234 real cos * q1234 unreal sin))) abs < eps.
	self assert: ((1 + 2 i) sin - (1 + 2 j k) sin) abs < eps.