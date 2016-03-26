tests-testing
testEqual
	self assert: one equals: onec.
	self assert: zero equals: zeroc.
	self assert: one equals: 1.0.
	self assert: three equals: 3.
	self assert: one ~= zero.
	self assert: 1.1 equals: (HyperDualNumber value: 1.1 eps: 2).
	self
		assert: 1 / 3
		equals:
			(HyperDualNumber
				value: 1 / 3
				eps: 2 / 3
				eps2: 5.4
				eps1eps2: 6.4).
	self assert: 1 / 3.0 ~= (HyperDualNumber value: 1 / 3) hash