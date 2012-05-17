tests-accessing
testZeroProbabilityGivesZeroNext
	| g |
	g := BernoulliGenerator withProbability: 0.0.
	self should: [g next = 0]