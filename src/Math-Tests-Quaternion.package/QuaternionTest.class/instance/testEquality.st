running
testEquality
	self assert: q1234 equals: q1234 copy.
	self assert: 1 + 2 i equals: 1 + 2 j k.
	self assert: 1 + 2 j k equals: 1 + 2 i.
	self deny: 1 + 2 j = (1 + 2 i).
	self deny: q1234 = 1.
	self assert: 1 k k equals: -1.
	self assert: 1 equals: -1 k k.
	self deny: q1234 = nil