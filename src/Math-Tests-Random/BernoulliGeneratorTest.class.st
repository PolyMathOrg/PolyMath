"
A BernoulliGeneratorTest is a test class for testing the behavior of BernoulliGenerator
"
Class {
	#name : #BernoulliGeneratorTest,
	#superclass : #TestCase,
	#category : 'Math-Tests-Random'
}

{ #category : #tests }
BernoulliGeneratorTest >> testGenerator [
	| g bern |
	g := PMLinearCongruentialRandomGenerator new.
	bern := PMBernoulliGenerator new.
	self
		assert: (bern generator isKindOf: PMBernoulliGenerator defaultGeneratorClass).
	bern generator: g.
	self assert: (bern generator isKindOf: PMLinearCongruentialRandomGenerator)
]

{ #category : #tests }
BernoulliGeneratorTest >> testNextYieldsOneOrZero [
	| gen |
	gen := PMBernoulliGenerator fair.
	self should: [ | x | x := gen next.
				(x = 0) or: [x = 1]].
]

{ #category : #tests }
BernoulliGeneratorTest >> testOneProbabilityGivesOneNext [
	| g |
	g := PMBernoulliGenerator withProbability: 1.
	self assert: g next equals: 1
]

{ #category : #tests }
BernoulliGeneratorTest >> testProbabilityIsMutable [
	| g |
	g := PMBernoulliGenerator withProbability: 0.0.
	self assert: g next equals: 0.
	self assert: g probability equals: 0.
	g probability: 1.
	self assert: g next equals: 1.
	self assert: g probability equals: 1
]

{ #category : #tests }
BernoulliGeneratorTest >> testZeroProbabilityGivesZeroNext [
	| g |
	g := PMBernoulliGenerator withProbability: 0.0.
	self assert: g next equals: 0
]
