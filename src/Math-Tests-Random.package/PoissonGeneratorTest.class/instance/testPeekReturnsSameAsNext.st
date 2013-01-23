tests
testPeekReturnsSameAsNext
	| poisson random |
	poisson := PoissonGenerator lambda: 0.1.
	random := poisson peek.
	self should: [random = poisson next].

	