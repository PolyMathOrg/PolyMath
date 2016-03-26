running
testSum
	self assert: 1 + 2 i + 3 j + 4 k equals: q1234.
	self assert: 1 + 2 i + (3 + 4 i) j equals: q1234.
	self assert: q1234 + 5 equals: (6 i: 2 j: 3 k: 4).
	self assert: 5 + q1234 equals: (6 i: 2 j: 3 k: 4).
	self assert: q1234 - 9 equals: (-8 i: 2 j: 3 k: 4).
	self assert: 9 - q1234 equals: (8 i: -2 j: -3 k: -4).
	self assert: q1234 + q1234 conjugated equals: q1234 real * 2.
	self assert: q1234 + q1234 negated equals: 0.
	self assert: q1234 isZero not.
	self assert: (q1234 negated + q1234) isZero