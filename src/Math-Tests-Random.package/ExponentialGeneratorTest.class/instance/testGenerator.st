tests
testGenerator
	| eg |
	eg := PMExponentialGenerator new.
	self
		assert: (eg generator isKindOf: PMExponentialGenerator defaultGeneratorClass).
	self assert: (eg generator isKindOf: PMRandomGenerator).
	eg generator: PMMersenneTwisterRandomGenerator new.
	self assert: (eg generator isKindOf: PMMersenneTwisterRandomGenerator).
	self assert: (eg next isKindOf: Number)