tests-accessing
testProbabilityIsMutable
	| g |
	g := BernoulliGenerator withProbability: 0.0.
	self should: [g next = 0].
	self should: [g p = 0].
	g p: 1.
	self should: [g next = 1].
	self should: [g p = 1].