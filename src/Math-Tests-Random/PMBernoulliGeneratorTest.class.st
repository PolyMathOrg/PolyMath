"
A BernoulliGeneratorTest is a test class for testing the behavior of BernoulliGenerator
"
Class {
	#name : #PMBernoulliGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #tests }
PMBernoulliGeneratorTest >> testNextYieldsOneOrZero [
	| gen |
	gen := PMBernoulliGenerator fair.
	self should: [ | x | x := gen next.
				(x = 0) or: [x = 1]].
]

{ #category : #tests }
PMBernoulliGeneratorTest >> testOneProbabilityGivesOneNext [
	| g |
	g := PMBernoulliGenerator withProbability: 1.
	self assert: g next equals: 1
]

{ #category : #tests }
PMBernoulliGeneratorTest >> testProbabilityIsMutable [
	| g |
	g := PMBernoulliGenerator withProbability: 0.0.
	self assert: g next equals: 0.
	self assert: g probability equals: 0.
	g probability: 1.
	self assert: g next equals: 1.
	self assert: g probability equals: 1
]

{ #category : #tests }
PMBernoulliGeneratorTest >> testZeroProbabilityGivesZeroNext [
	| g |
	g := PMBernoulliGenerator withProbability: 0.0.
	self assert: g next equals: 0
]
