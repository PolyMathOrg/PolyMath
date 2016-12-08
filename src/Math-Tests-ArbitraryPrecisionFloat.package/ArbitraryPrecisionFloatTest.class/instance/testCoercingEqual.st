testing-coercing
testCoercingEqual
	self assert: half = (1/2).
	self assert: (1/2) = half.
	self deny: half = (1/3).
	self deny: (1/3) = half.

	self assert: two = 2.
	self assert: -2 = minusTwo.
	self deny: -3 = two.
	self deny: two = 3.

	self assert: half = (0.5e0).
	self assert: (0.5e0) = half.
	self deny: half = (0.33e0).
	self deny: (0.33e0) = half.

	self assert: half = (0.5s1).
	self assert: (0.5s1) = half.
	self deny: half = (0.33s2).
	self deny: (0.33s2) = half.