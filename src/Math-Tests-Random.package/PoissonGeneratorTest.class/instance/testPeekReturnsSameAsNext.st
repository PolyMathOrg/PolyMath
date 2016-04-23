tests
testPeekReturnsSameAsNext
	| poisson random |
	poisson := PMPoissonGenerator lambda: 0.1.
	random := poisson peek.
	self assert: random equals: poisson next