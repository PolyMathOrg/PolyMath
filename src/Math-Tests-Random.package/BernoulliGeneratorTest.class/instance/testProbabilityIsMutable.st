tests
testProbabilityIsMutable
	| g |
	g := PMBernoulliGenerator withProbability: 0.0.
	self assert: g next equals: 0.
	self assert: g probability equals: 0.
	g probability: 1.
	self assert: g next equals: 1.
	self assert: g probability equals: 1