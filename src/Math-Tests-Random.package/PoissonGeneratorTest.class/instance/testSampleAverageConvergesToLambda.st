tests
testSampleAverageConvergesToLambda
	"law of large numbers"

	"made non-random, old random version in comments"

	| poisson samples |
	samples := OrderedCollection new.
	poisson := PMPoissonGenerator lambda: 5.	"((1000 atRandom: Random new) -1)"
	poisson generator seed: 42.	"added for non-randomness"
	1000 timesRepeat: [ samples add: poisson next ].
	self assert: samples average >= (poisson lambda * 0.8).
	self assert: samples average <= (poisson lambda * 1.2)