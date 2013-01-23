running
testHash
	self assert: q1234 hash = q1234 copy hash.
	self assert: (1 + 2 i) hash = (1 + 2 j k) hash.
	self assert: (1 k k) hash = -1 hash.