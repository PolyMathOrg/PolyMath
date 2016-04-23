tests
testZeroProbabilityGivesZeroNext
	| g |
	g := PMBernoulliGenerator withProbability: 0.0.
	self assert: g next equals: 0