running
testSum
	self  assert: 1 + 2 i + 3 j + 4 k = (q1234).
	self  assert: (1 + 2 i )+ (3 + 4 i) j = (q1234).
	self  assert: (q1234) + 5 = (6 i: 2 j: 3 k: 4).
	self  assert: 5 + (q1234) = (6 i: 2 j: 3 k: 4).
	self  assert: (q1234) - 9 = (-8 i: 2 j: 3 k: 4).
	self  assert: 9 - (q1234) = (8 i: -2 j: -3 k: -4).

	self assert: q1234 + q1234 conjugated  = (q1234 real * 2).
	self assert: q1234 + q1234 negated = (0).
	self assert: q1234 isZero not.
	self assert: (q1234 negated + q1234) isZero.