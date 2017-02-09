tests
testWrongDistributionProbabilistic
	"is a probabilistic test that occasionally fails, but it should happen rarely"

	| d |
	"wrong distribution with the correct mean and sd"
	d := PMLaplaceDistribution shape: 0 scale: (1 / 2) sqrt.
	self assert: d average equals: 0.
	self assert: (d standardDeviation closeTo: 1).
	d := self numberOfRejectionsFor: d.
	self assert: d > 60