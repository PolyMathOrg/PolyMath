tests
testPeekReturnsSameTwice
	| poisson random |
	poisson := PoissonGenerator lambda: 0.1.
	random := poisson peek.
	self assert: random equals: poisson peek