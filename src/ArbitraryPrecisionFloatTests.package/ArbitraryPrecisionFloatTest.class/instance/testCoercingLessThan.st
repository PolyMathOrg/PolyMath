testing-coercing
testCoercingLessThan
	self deny: half < (1/2).
	self assert: (1/3) < half.
	self assert: minusOne < (1/2).
	self deny: (1/3) < minusTwo.

	self assert: two < 3.
	self deny: two < 2.
	self deny: two < 1.
	self deny: two < -1.
	self assert:  minusTwo < -1.
	self assert:  minusTwo < 1.
	self deny: minusTwo < -2.
	self deny: minusTwo < -3.

	self deny: half < (0.5e0).
	self deny: half < (0.33e0).
	self assert: half < (0.66e0).
	self deny: (0.5e0) < half.
	self assert: (0.33e0) < half.
	self deny: (0.66e0) < half.

	self deny: half < (0.5s1).
	self deny: half < (0.33s2).
	self assert: half < (0.66s2).
	self deny: (0.5s1) < half.
	self assert: (0.33s2) < half.
	self deny: (0.66s2) < half.