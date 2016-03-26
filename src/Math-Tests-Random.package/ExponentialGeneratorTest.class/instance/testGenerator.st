tests-as yet unclassified
testGenerator
	| eg |
	eg := ExponentialGenerator new.
	self
		assert: (eg generator isKindOf: ExponentialGenerator defaultGenerator).
	self assert: (eg generator isKindOf: RandomGenerator).
	eg generator: MersenneTwisterRandom new.
	self assert: (eg generator isKindOf: MersenneTwisterRandom).
	self assert: (eg next isKindOf: Number)