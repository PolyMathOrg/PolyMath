tests-accessing
testGenerator
	| g bern |
	g := LCRandom new.
	bern := BernoulliGenerator new.
	self
		assert: (bern generator isKindOf: BernoulliGenerator defaultGenerator).
	bern generator: g.
	self assert: (bern generator isKindOf: LCRandom)