tests-as yet unclassified
testGenerator
	| eg |
	eg := ExponentialGenerator new.
	self should: [eg generator isKindOf: ExponentialGenerator defaultGenerator].
	self should: [eg generator isKindOf: RandomGenerator].
	eg generator: MersenneTwisterRandom new.
	self should: [eg generator isKindOf: MersenneTwisterRandom].
	self should: [eg next isKindOf: Number].