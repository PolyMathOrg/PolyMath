Class {
	#name : #PMLaplaceGeneratorTest,
	#superclass : #TestCase,
	#category : #'Math-Tests-Random'
}

{ #category : #tests }
PMLaplaceGeneratorTest >> testPeekIsIdempotent [
	| g |
	g := PMLaplaceGenerator shape: 0.5 scale: 0.3.
	self assert: g peek equals: g peek
]
