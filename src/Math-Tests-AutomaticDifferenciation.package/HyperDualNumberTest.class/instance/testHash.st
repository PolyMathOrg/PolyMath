tests
testHash
	self assert: one hash equals: onec hash.
	self assert: zero hash equals: zeroc hash.
	self assert: one hash equals: 1 hash.
	self assert: three hash equals: 3 hash.
	self assert: one hash ~= zero hash.
	self
		assert: 1.1 hash
		equals:
			(PMHyperDualNumber
				value: 1.1
				eps: 2
				eps2: 0.8
				eps1eps2: 0.7) hash.
	self
		assert: (1 / 3) hash
		equals:
			(PMHyperDualNumber
				value: 1 / 3
				eps: 2 / 3
				eps2: 0.8
				eps1eps2: 0.7) hash.
	self assert: 1 / 3.0 hash ~= (PMHyperDualNumber value: 1 / 3) hash