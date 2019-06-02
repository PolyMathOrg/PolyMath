Class {
	#name : #PMLaplaceGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #'as yet unclassified' }
PMLaplaceGeneratorTest >> classToTest [ 
	^ PMLaplaceGenerator 
]

{ #category : #accessing }
PMLaplaceGeneratorTest >> testPeekIsIdempotent [
	| g |
	g := PMLaplaceGenerator shape: 0.5 scale: 0.3.
	self assert: g peek equals: g peek
]
