tests-accessing
testOneProbabilityGivesOneNext
	| g |
	g := BernoulliGenerator withProbability: 1.
	self assert: g next equals: 1