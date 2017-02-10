tests-mathematical functions
testSqrt
	| a |
	self
		assertEquality: (PMDualNumber value: 16 eps: 5) sqrt
		and: (PMDualNumber value: 4 eps: 5 / 8).
	a := zero sqrt.
	self assert: a value equals: 0.
	self assert: a eps > 1e60