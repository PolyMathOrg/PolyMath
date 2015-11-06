tests
testSampleAverageConvergesToLambda
	"law of large numbers"
	| poisson samples |
	samples := OrderedCollection new.
	poisson := PoissonGenerator lambda: ((1000 atRandom: Random new) -1).
	1000 timesRepeat: [samples add: poisson next].
	self should: [samples average >= (poisson lambda * 0.8)].
	self should: [samples average <= (poisson lambda * 1.2)].