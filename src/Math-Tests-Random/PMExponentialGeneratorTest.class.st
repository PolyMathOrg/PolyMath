"
A PMExponentialGeneratorTest is a test class for testing the behavior of PMExponentialGenerator
"
Class {
	#name : #PMExponentialGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #tests }
PMExponentialGeneratorTest >> testGenerator [
	| eg |
	eg := PMExponentialGenerator new.
	self
		assert: (eg generator isKindOf: PMExponentialGenerator defaultGeneratorClass).
	self assert: (eg generator isKindOf: PMPseudoRandomNumberGenerator).
	eg generator: PMMersenneTwisterRandomGenerator new.
	self assert: (eg generator isKindOf: PMMersenneTwisterRandomGenerator).
	self assert: (eg next isKindOf: Number)
]

{ #category : #tests }
PMExponentialGeneratorTest >> testPeekIsIdempotent [
	| eg |
	eg := PMExponentialGenerator new.
	self assert: eg peek equals: eg peek.
	self assert: eg peek equals: eg next
]

{ #category : #tests }
PMExponentialGeneratorTest >> testSampleMeanConvergesToDistributionMean [
	"testing a random sample seems suspect. We use a 5% interval here"

	| gen sample |
	gen := PMExponentialGenerator mean: 10.
	sample := Array new: 10000.
	sample := sample collect: [ :each | gen next ].
	
	self
		assert: (sample average between: gen mean * 0.95 and: gen mean * 1.05)
]
