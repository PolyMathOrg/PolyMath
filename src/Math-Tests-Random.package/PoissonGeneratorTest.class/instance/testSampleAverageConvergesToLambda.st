tests
testSampleAverageConvergesToLambda
	"law of large numbers"
	| poisson samples |
	samples := OrderedCollection new.
	poisson := PoissonGenerator lambda: (Integer random * 1000) asInteger.
	1000 timesRepeat: [samples add: poisson next].
	self should: [samples average > (poisson lambda * 0.8)].
	self should: [samples average < (poisson lambda * 1.2)].