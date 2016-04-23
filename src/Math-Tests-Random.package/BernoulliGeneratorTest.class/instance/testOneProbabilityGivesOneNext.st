tests
testOneProbabilityGivesOneNext
	| g |
	g := PMBernoulliGenerator withProbability: 1.
	self assert: g next equals: 1