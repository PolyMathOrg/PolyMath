tests-arithmetic
testNegated
	three eps1eps2: -4.
	self assert: three negated equals: -3.
	self assert: three negated eps equals: -1.
	self assert: three negated eps2 equals: -1.
	self assert: three negated eps1eps2 equals: 4