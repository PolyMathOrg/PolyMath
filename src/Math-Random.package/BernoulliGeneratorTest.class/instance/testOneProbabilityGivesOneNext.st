tests-accessing
testOneProbabilityGivesOneNext
	| g |
	g := BernoulliGenerator withProbability: 1.
	self should: [g next = 1].