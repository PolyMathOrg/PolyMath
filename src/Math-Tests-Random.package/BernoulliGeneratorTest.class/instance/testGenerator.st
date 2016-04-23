tests
testGenerator
	| g bern |
	g := PMLinearCongruentialRandomGenerator new.
	bern := PMBernoulliGenerator new.
	self
		assert: (bern generator isKindOf: PMBernoulliGenerator defaultGeneratorClass).
	bern generator: g.
	self assert: (bern generator isKindOf: PMLinearCongruentialRandomGenerator)