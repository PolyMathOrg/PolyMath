Class {
	#name : #PMLaplaceGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-RandomDistributionBased'
}

{ #category : #'as yet unclassified' }
PMLaplaceGeneratorTest >> classToTest [ 
	^ PMLaplaceGenerator 
]

{ #category : #accessing }
PMLaplaceGeneratorTest >> testPeekAlwaysReplyTheSameValue [
	| g |
	g := self classToTest shape: 0.5 scale: 0.3.
	self assert: g peek equals: g peek
]
