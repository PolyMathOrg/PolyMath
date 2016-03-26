tests-accessing
testZeroProbabilityGivesZeroNext
	| g |
	g := BernoulliGenerator withProbability: 0.0.
	self assert: g next equals: 0