running
testEquality
	self assert: q1234 = q1234 copy.
	self assert: (1 + 2 i) = (1 + 2 j k).
	self assert: (1 + 2 j k) = (1 + 2 i).
	self deny: (1 + 2 j) = (1 + 2 i).
	self deny: q1234 = 1.
	self assert: (1 k k) = -1.
	self assert: 1 = (-1 k k).
	self deny: q1234 = nil.