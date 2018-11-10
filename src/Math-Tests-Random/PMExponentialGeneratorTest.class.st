"
An ExponentialGeneratorTest is a test class for testing the behavior of ExponentialGenerator
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
	self assert: (eg generator isKindOf: PMRandomGenerator).
	eg generator: PMMersenneTwisterRandomGenerator new.
	self assert: (eg generator isKindOf: PMMersenneTwisterRandomGenerator).
	self assert: (eg next isKindOf: Number)
]

{ #category : #tests }
PMExponentialGeneratorTest >> testPeekAlwaysAnswersTheSame [
	| eg |
	eg := PMExponentialGenerator new.
	self assert: eg peek equals: eg peek.
	self assert: eg peek equals: eg next
]

{ #category : #tests }
PMExponentialGeneratorTest >> testSampleMeanConvergesToDistributionMean [
	"testing a random sample seems suspect. We use a 5% interval here"

	| eg arr |
	eg := PMExponentialGenerator mean: 10.
	arr := Array new: 10000.
	(1 to: 10000) do: [ :index | arr at: index put: eg next ].
	self
		assert: (arr average between: eg mean * 0.95 and: eg mean * 1.05)
]
