tests
testMaximumCount
	self assert: h maximumCount equals: 1.
	h accumulate: 3.
	self assert: h maximumCount equals: 2