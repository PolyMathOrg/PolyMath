tests-accessing
testProbabilityIsMutable
	| g |
	g := BernoulliGenerator withProbability: 0.0.
	self assert: g next equals: 0.
	self assert: g p equals: 0.
	g p: 1.
	self assert: g next equals: 1.
	self assert: g p equals: 1