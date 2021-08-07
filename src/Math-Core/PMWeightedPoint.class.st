"
I'm a simple point (two values with a weight and an error).
"
Class {
	#name : #PMWeightedPoint,
	#superclass : #Object,
	#instVars : [
		'xValue',
		'yValue',
		'weight',
		'error'
	],
	#category : #'Math-Core'
}

{ #category : #creation }
PMWeightedPoint class >> point: aPoint [
	
	^ self new initialize: aPoint weight: 1
]

{ #category : #creation }
PMWeightedPoint class >> point: aNumber count: anInteger [
	
	^ self
		point: aNumber @ anInteger
		weight:
			(anInteger > 0
				ifTrue: [ 1 / anInteger ]
				ifFalse: [ 1 ])
]

{ #category : #creation }
PMWeightedPoint class >> point: aPoint error: aNumber [
	
	^ self new initialize: aPoint error: aNumber
]

{ #category : #creation }
PMWeightedPoint class >> point: aPoint weight: aNumber [
	
	^ self basicNew initialize: aPoint weight: aNumber
]

{ #category : #information }
PMWeightedPoint >> chi2ComparisonContribution: aWeightedPoint [

	^ (aWeightedPoint yValue - yValue) squared / (1 / aWeightedPoint weight + (1 / weight))
]

{ #category : #information }
PMWeightedPoint >> chi2Contribution: aFunction [

	^ (yValue - (aFunction value: xValue)) squared * weight
]

{ #category : #accessing }
PMWeightedPoint >> error [

	error isNil
		ifTrue: [ error := 1 / weight sqrt ].
	^ error
]

{ #category : #initialization }
PMWeightedPoint >> initialize: aPoint error: aNumber [

	error := aNumber.
	^ self initialize: aPoint weight: 1 / aNumber squared
]

{ #category : #initialization }
PMWeightedPoint >> initialize: aPoint weight: aNumber [

	xValue := aPoint x.
	yValue := aPoint y.
	weight := aNumber.
	^ self
]

{ #category : #accessing }
PMWeightedPoint >> point [

	^ xValue @ yValue
]

{ #category : #accessing }
PMWeightedPoint >> weight [
	^weight
]

{ #category : #accessing }
PMWeightedPoint >> xValue [
	^xValue
]

{ #category : #accessing }
PMWeightedPoint >> yValue [
	^yValue
]
