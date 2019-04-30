"
I'm a simple object summing vectors. The idea that I does not keep the data but information that are representative of the accumulated data. 

The class VectorAccumulator has two instance variables:
- count counts the number of vectors accumulated in the object so far; 
- average keeps the average of the accumulated vector.

"
Class {
	#name : #PMVectorAccumulator,
	#superclass : #Object,
	#instVars : [
		'count',
		'average'
	],
	#category : #'Math-Numerical-Math-UtilsAccumulator'
}

{ #category : #'instance creation' }
PMVectorAccumulator class >> new: anInteger [
	^ self basicNew initialize: anInteger
]

{ #category : #transformation }
PMVectorAccumulator >> accumulate: aVectorOrArray [
	| delta |
	count := count + 1.
	delta := average - aVectorOrArray asPMVector scaleBy: 1 / count.
	average accumulateNegated: delta.
	^ delta
]

{ #category : #operations }
PMVectorAccumulator >> average [
	^ average
]

{ #category : #operations }
PMVectorAccumulator >> count [
	^ count
]

{ #category : #initialization }
PMVectorAccumulator >> initialize: anInteger [
	average := PMVector new: anInteger.
	self reset
]

{ #category : #printing }
PMVectorAccumulator >> printOn: aStream [
	super printOn: aStream.
	aStream space.
	count printOn: aStream.
	aStream space.
	average printOn: aStream
]

{ #category : #initialization }
PMVectorAccumulator >> reset [
	count := 0.
	average atAllPut: 0
]
