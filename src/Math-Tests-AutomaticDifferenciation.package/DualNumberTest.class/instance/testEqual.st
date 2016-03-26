tests-testing
testEqual
	self assert: one equals: onec.
	self assert: zero equals: zeroc.
	self assert: one equals: 1.0.
	self assert: three equals: 3.
	self assert: one ~= zero.
	self assert: 1.1 equals: (DualNumber value: 1.1 eps: 2).
	self assert: 1 / 3 equals: (DualNumber value: 1 / 3 eps: 2 / 3).
	self assert: 1 / 3.0 ~= (DualNumber value: 1 / 3 eps: 2) hash