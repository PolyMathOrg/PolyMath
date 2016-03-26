tests
testPeekWorksAfterSampling
	| poisson random |
	poisson := PoissonGenerator lambda: 0.1.
	(1 to: 100) do: [ :ea | poisson next ].
	random := poisson peek.
	self assert: random equals: poisson peek.
	self assert: random equals: poisson next