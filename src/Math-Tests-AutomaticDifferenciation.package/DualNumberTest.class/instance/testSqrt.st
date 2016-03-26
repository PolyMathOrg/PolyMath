tests-mathematical functions
testSqrt
	| a |
	self
		assertEquality: (DualNumber value: 16 eps: 5) sqrt
		and: (DualNumber value: 4 eps: 5 / 8).
	a := zero sqrt.
	self assert: a value equals: 0.
	self assert: a eps > 1e60