running
testHash
	self assert: q1234 hash equals: q1234 copy hash.
	self assert: (1 + 2 i) hash equals: (1 + 2 j k) hash.
	self assert: 1 k k hash equals: -1 hash