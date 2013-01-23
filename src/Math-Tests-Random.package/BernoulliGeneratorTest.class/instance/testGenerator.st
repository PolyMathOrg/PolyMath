tests-accessing
testGenerator
	| g bern |
	g := LCRandom new.
	bern := BernoulliGenerator new.
	self should: [bern generator isKindOf: BernoulliGenerator defaultGenerator].
	bern generator: g.
	self should: [bern generator isKindOf: LCRandom]
	